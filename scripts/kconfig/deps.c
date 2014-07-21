#include <libgen.h>
#include <locale.h>
#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/stat.h>

#include "list.h"

#define LKC_DIRECT_LINK
#include "lkc.h"

static const char depdirs[] = "include/config/depends-dirs.mk";
static const char depfile[] = "include/config/depends.mk";

struct package;

struct dependency {
	struct package *package;
	struct list_head list;
};

static struct dependency *dependency_create(struct package *package)
{
	struct dependency *dependency;

	dependency = calloc(1, sizeof(*dependency));
	if (!dependency)
		return NULL;

	INIT_LIST_HEAD(&dependency->list);
	dependency->package = package;

	return dependency;
}

static void dependency_destroy(struct dependency *dependency)
{
	free(dependency);
}

static void dependency_list_free(struct list_head *head)
{
	struct list_head *node, *next;

	list_for_each_safe(node, next, head) {
		struct dependency *dep =
			container_of(node, struct dependency, list);
		list_del(node);
		free(dep);
	}
}

static struct symbol *stable = NULL;

struct package {
	struct symbol *symbol;
	struct list_head list;
	struct list_head deps;
	unsigned long numdeps;
	unsigned long flags;
	char *path;
};

#define	PACKAGE_VIRTUAL		(1 << 0)
#define	PACKAGE_PLATFORM	(1 << 1)
#define	PACKAGE_STABLE		(1 << 2)
#define	PACKAGE_PARENT		(1 << 3)

static bool package_is_virtual(struct package *package)
{
	return (package->flags & PACKAGE_VIRTUAL) != 0;
}

static bool package_is_platform(struct package *package)
{
	return (package->flags & PACKAGE_PLATFORM) != 0;
}

static bool package_is_stable(struct package *package)
{
	return (package->flags & PACKAGE_STABLE) != 0;
}

static struct package *package_create(struct symbol *symbol, const char *path)
{
	struct package *package = NULL;

	package = calloc(1, sizeof(*package));
	if (!package)
		return NULL;

	INIT_LIST_HEAD(&package->list);
	INIT_LIST_HEAD(&package->deps);
	package->symbol = symbol;
	package->path = path ? strdup(path) : NULL;

	if (strncmp(symbol->name, "VIRTUAL_", 8) == 0)
		package->flags |= PACKAGE_VIRTUAL;

	if (strncmp(symbol->name, "PLATFORM_", 9) == 0)
		package->flags |= PACKAGE_PLATFORM;

	return package;
}

static int package_destroy(struct package *package)
{
	struct list_head *node, *next;

	if (!package)
		return -EINVAL;

	free(package->path);

	list_for_each_safe(node, next, &package->deps) {
		struct dependency *dep = list_entry(node, struct dependency, list);
		dependency_destroy(dep);
	}

	free(package);
	return 0;
}

static struct package *package_resolve_virtual(struct package *package)
{
	if (package_is_virtual(package)) {
		struct dependency *dep;

		/* TODO: recursively resolve virtual packages? */
		list_for_each_entry(dep, &package->deps, list) {
			package = dep->package;
			break;
		}
	}

	return package;
}

static struct package *find_package(struct list_head *packages, struct symbol *symbol)
{
	struct package *package = NULL;
	struct package *ret = NULL;

	list_for_each_entry(package, packages, list) {
		if (package->symbol == symbol) {
			ret = package;
			break;
		}
	}

	return ret;
}

static void count_package_deps(struct list_head *packages,
		struct package *package)
{
	struct dependency *dep;

	list_for_each_entry(dep, &package->deps, list) {
		struct package *pkg = package_resolve_virtual(dep->package);
		count_package_deps(packages, pkg);
		pkg->numdeps++;
	}
}

static void resolve_deps(struct list_head *packages)
{
	struct package *package;

	list_for_each_entry(package, packages, list)
		count_package_deps(packages, package);

	list_for_each_entry(package, packages, list) {
		struct dependency *dep;
		struct dependency *tmp;

		list_for_each_entry_safe(dep, tmp, &package->deps, list) {
			dep->package = package_resolve_virtual(dep->package);
			if (dep->package == package) {
				list_del_init(&dep->list);
				dependency_destroy(dep);
			}
		}
	}
}

static tristate build_package_deps_expr(struct list_head *packages,
		struct list_head *deps, struct expr *expr)
{
	struct list_head new_deps = LIST_HEAD_INIT(new_deps);
	tristate left_val, right_val = no;
	tristate val = no;

	switch (expr->type) {
	case E_AND:
		left_val = build_package_deps_expr(
			packages, &new_deps, expr->left.expr);
		right_val = build_package_deps_expr(
			packages, &new_deps, expr->right.expr);
		val = EXPR_AND(left_val, right_val);
		break;

	case E_OR:
		left_val = build_package_deps_expr(
			packages, &new_deps, expr->left.expr);
		if (left_val == no)
			dependency_list_free(&new_deps);
		right_val = build_package_deps_expr(
			packages, &new_deps, expr->right.expr);
		val = EXPR_OR(left_val, right_val);
		break;

	case E_NOT:
		val = build_package_deps_expr(
			packages, &new_deps, expr->left.expr);
		val = EXPR_NOT(val);
		break;

	case E_SYMBOL:
		val = expr->left.sym->curr.tri;
		if (val != no) {
			struct package *dep =
				find_package(packages, expr->left.sym);
			if (dep) {
				struct dependency *d =
					dependency_create(dep);
				list_add_tail(&d->list, deps);
			}
		}
		return val;

	default:
		fprintf(stderr, "WARNING: Unhandled expression type %d\n",
			expr->type);
		return no;
	}

	if (val != no)
		list_splice_tail(&new_deps, deps);
	else
		dependency_list_free(&new_deps);

	return val;
}

static void build_package_deps(struct list_head *packages,
		struct package *package)
{
	if (package->symbol->rev_dep.expr) {
		struct expr_value *rd = &package->symbol->rev_dep;
		struct list_head deps = LIST_HEAD_INIT(deps);
		struct list_head *node, *next;

		/* Create the list of packages that depend on this one */
		build_package_deps_expr(packages, &deps, rd->expr);
		/* Add this package as dependency to all these packages */
		list_for_each_safe(node, next, &deps) {
			struct dependency *dep =
				container_of(node, struct dependency, list);
			struct package *pkg = dep->package;

			list_del_init(&dep->list);
			dep->package = package;
			list_add_tail(&dep->list, &pkg->deps);
		}
	}
}

static bool find_symbol(struct expr *e, struct symbol *sym)
{
	if (!e)
		return false;

	switch (e->type) {
	case E_AND:
	case E_OR:
		if (find_symbol(e->left.expr, sym))
			return true;

		if (find_symbol(e->right.expr, sym))
			return true;

		break;

	case E_SYMBOL:
		if (sym == e->left.sym)
			return true;

		break;

	default:
		break;
	}

	return false;
}

static bool package_depends(struct package *package, struct symbol *symbol)
{
	return find_symbol(symbol->rev_dep.expr, package->symbol);
}

static bool symbol_is_stable_abi(struct symbol *sym)
{
	if (!sym || !sym->name)
		return false;

	return strcmp(sym->name, "STABLE_ABI") == 0;
}

static bool symbol_is_parent(struct list_head *packages, struct symbol *symbol)
{
	struct package *package;
	int len;

	if (!symbol || !symbol->name)
		return false;

	len = strlen(symbol->name);

	list_for_each_entry(package, packages, list) {
		if (!package->symbol || !package->symbol->name)
			continue;

		if (strncmp(package->symbol->name, symbol->name, len) == 0)
			if (strlen(package->symbol->name) > len)
				return true;
	}

	return false;
}

static bool symbol_is_package(struct symbol *symbol)
{
	if (!symbol || !symbol->name)
		return false;

	if (strncmp(symbol->name, "PACKAGE_", 8) == 0)
		return true;

	if (strncmp(symbol->name, "PLATFORM_", 9) == 0)
		return true;

	if (strncmp(symbol->name, "VIRTUAL_", 8) == 0)
		return true;

	return false;
}

static bool symbol_is_platform(struct symbol *symbol)
{
	if (!symbol || !symbol->name)
		return false;

	if (strncmp(symbol->name, "PLATFORM_", 9) == 0)
		return true;

	return false;
}

static void build_deps(struct list_head *packages)
{
	struct package *package;

	list_for_each_entry(package, packages, list) {
		if (package_depends(package, stable))
			package->flags |= PACKAGE_STABLE;

		build_package_deps(packages, package);

		if (symbol_is_parent(packages, package->symbol))
			package->flags |= PACKAGE_PARENT;
	}
}

static bool check_deps(struct expr *e)
{
	struct symbol *sym;

	if (!e)
		return true;

	sym = e->left.sym;

	switch (e->type) {
	case E_AND:
	case E_OR:
		if (!check_deps(e->left.expr))
			return false;

		if (!check_deps(e->right.expr))
			return false;

		break;

	case E_SYMBOL:
		if (symbol_is_package(sym) && !symbol_is_platform(sym))
			return false;

		break;

	default:
		break;
	}

	return true;
}

static struct package *package_create_from_menu(struct menu *menu)
{
	struct package *package = NULL;
	struct symbol *symbol;
	char *filename = NULL;
	char *path = NULL;

	if (!menu || !menu->sym)
		return NULL;

	symbol = menu->sym;

	sym_calc_value(symbol);

	filename = strdup(menu->file->name);
	path = dirname(filename);

	switch (symbol->type) {
	case S_BOOLEAN:
	case S_TRISTATE:
		if (sym_get_tristate_value(symbol) == yes) {
			if (symbol->flags & (SYMBOL_CHOICE | SYMBOL_CHOICEVAL)) {
				if (!symbol_is_platform(symbol))
					break;
			}

			if (!check_deps(symbol->dir_dep.expr))
				break;

			package = package_create(symbol, path);
			if (package) {
			}
		}
		break;

	default:
		break;
	}

	free(filename);
	return package;
}

static bool platform_has_child(struct package *package)
{
	if (!package_is_platform(package))
		return false;

	return (package->flags & PACKAGE_PARENT) != 0;
}

static int create_package_list(struct list_head *head, struct menu *root)
{
	struct menu *menu = root->list;
	struct package *package;
	int ret = 0;

	if (!head || !root)
		return -EINVAL;

	while (menu) {
		if (symbol_is_package(menu->sym)) {
			package = package_create_from_menu(menu);
			if (package)
				list_add_tail(&package->list, head);
		}

		if (symbol_is_stable_abi(menu->sym))
			stable = menu->sym;

		if (menu->list) {
			menu = menu->list;
			continue;
		}

		if (!menu->next) {
			while ((menu = menu->parent)) {
				if (menu->next) {
					menu = menu->next;
					break;
				}
			}
		} else {
			menu = menu->next;
		}
	}

	return ret;
}

static int destroy_package_list(struct list_head *head)
{
	struct package *package;
	struct list_head *node;
	struct list_head *temp;
	int ret = 0;

	list_for_each_safe(node, temp, head) {
		package = list_entry(node, struct package, list);
		package_destroy(package);
	}

	return ret;
}

static int list_sort(struct list_head *head)
{
	struct package *package;
	struct package *pivot;
	struct list_head *pos;
	struct list_head *n;
	struct package *pkg;
	LIST_HEAD(sorted);
	int ret = 0;

	if (list_empty(head))
		return 0;

	pivot = list_entry(head->next, struct package, list);
	list_del_init(&pivot->list);
	list_add(&pivot->list, &sorted);

	list_for_each_safe(pos, n, head) {
		package = list_entry(pos, struct package, list);
		list_del_init(pos);

		list_for_each_entry(pkg, &sorted, list) {
			if (package->numdeps > pkg->numdeps) {
				list_add(pos, pkg->list.prev);
				break;
			}
		}

		if (list_empty(pos))
			list_add_tail(&package->list, &sorted);
	}

	if (!list_empty(head)) {
		fprintf(stderr, "ERROR! list not empty!\n");
		return -ENOTEMPTY;
	}

	/* relink to the original list head */
	head->prev = sorted.prev;
	head->next = sorted.next;
	head->prev->next = head;
	head->next->prev = head;

	return ret;
}

static int write_depends(struct list_head *packages, const char *filename)
{
	struct package *package;
	FILE *fp;

	fp = fopen(filename, "w");
	if (!fp)
		return -errno;

	list_for_each_entry(package, packages, list) {
		bool have_stable = false;
		struct dependency *dep;

		if (package_is_virtual(package) || platform_has_child(package))
			continue;

		fprintf(fp, "build/%s/.install: \\\n", package->path);
		fprintf(fp, "\tbuild/%s.hash", package->path);

		list_for_each_entry(dep, &package->deps, list) {
			if (!package_is_stable(dep->package)) {
				char *path = dep->package->path;
				fprintf(fp, " \\\n\tbuild/%s/.install", path);
			} else {
				have_stable = true;
			}
		}

		if (have_stable) {
			fprintf(fp, " |");

			list_for_each_entry(dep, &package->deps, list) {
				if (package_is_stable(dep->package)) {
					char *path = dep->package->path;
					fprintf(fp, " \\\n\tbuild/%s/.install", path);
				}
			}
		}

		fprintf(fp, "\n\n");
	}

	fprintf(fp, "build/.install:");

	list_for_each_entry(package, packages, list) {
		if (package_is_virtual(package) || platform_has_child(package))
			continue;

		fprintf(fp, " \\\n\tbuild/%s/.install",
				package->path);
	}

	fputs("\n\n", fp);

	fputs("build/%.hash: %/Makefile\n", fp);
	fputs("\t$(call cmd,hash_file)\n", fp);
	fputs("\n", fp);

	list_for_each_entry(package, packages, list) {
		if (package_is_virtual(package) || platform_has_child(package))
			continue;

		fprintf(fp, "build/%s.hash: $(wildcard $(srctree)/%s/depends.mk)\n",
				package->path, package->path);
	}

	list_for_each_entry(package, packages, list) {
		if (package_is_virtual(package) || platform_has_child(package))
			continue;

		fputs("\n", fp);
		fprintf(fp, "dep-hash-file := build/%s.hash\n", package->path);
		fprintf(fp, "dep-obj := %s\n", package->path);
		fprintf(fp, "-include %s/depends.mk\n", package->path);
	}

	fclose(fp);
	return 0;
}

static int write_compat(struct list_head *packages, const char *filename)
{
	struct package *master = NULL;
	struct package *package;
	FILE *fp;

	list_sort(packages);

	fp = fopen(filename, "w");
	if (!fp) {
		return -errno;
	}

	fprintf(fp, "depends-dirs =");

	list_for_each_entry(package, packages, list) {
		if (package_is_virtual(package) ||
		    package_is_platform(package))
			continue;

		fprintf(fp, " \\\n\t%s", package->path);
	}

	list_for_each_entry(package, packages, list) {
		if (package_is_platform(package) &&
		    !platform_has_child(package))
			fprintf(fp, " \\\n\t%s", package->path);
	}

	fprintf(fp, "\n\ndepends-platforms =");

	list_for_each_entry(package, packages, list) {
		if (package_is_platform(package) &&
		    !platform_has_child(package)) {
			fprintf(fp, " \\\n\t%s", package->path);
			master = package;
		}
	}

	if (master)
		fprintf(fp, "\n\nmaster-platform = %s\n", master->path);

	fclose(fp);
	return 0;
}

int main(int argc, char *argv[])
{
	LIST_HEAD(packages);
	const char *name;
	int ret = 0;
	int opt;

	setlocale(LC_ALL, "");
	bindtextdomain(PACKAGE, LOCALEDIR);
	textdomain(PACKAGE);

	while ((opt = getopt(argc, argv, "h")) != -1) {
	}

	if (optind == argc) {
		printf(_("%s: Kconfig file missing\n"), argv[0]);
		return 1;
	}

	name = argv[optind];
	conf_parse(name);
	conf_read(NULL);

	ret = create_package_list(&packages, &rootmenu);
	if (ret < 0) {
		fprintf(stderr, _("failed to create package list\n"));
		return 1;
	}

	build_deps(&packages);
	resolve_deps(&packages);

	write_depends(&packages, depfile);
	write_compat(&packages, depdirs);

	destroy_package_list(&packages);
	return 0;
}
