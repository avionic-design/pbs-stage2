#include <locale.h>
#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/stat.h>

#define LKC_DIRECT_LINK
#include "lkc.h"

static const char depfile[] = ".depends";

struct list_head {
	struct list_head *prev;
	struct list_head *next;
};

#define LIST_HEAD_INIT(name) { &(name), &(name) }
#define LIST_HEAD(name) \
	struct list_head name = LIST_HEAD_INIT(name)

static void INIT_LIST_HEAD(struct list_head *head)
{
	head->prev = head;
	head->next = head;
}

static int list_empty(struct list_head *head)
{
	return head->next == head;
}

static void __list_add(struct list_head *new, struct list_head *prev,
		struct list_head *next)
{
	next->prev = new;
	new->next = next;
	new->prev = prev;
	prev->next = new;
}

static void list_add(struct list_head *new, struct list_head *head)
{
	__list_add(new, head, head->next);
}

static void list_add_tail(struct list_head *new, struct list_head *head)
{
	__list_add(new, head->prev, head);
}

static void __list_del(struct list_head *prev, struct list_head *next)
{
	next->prev = prev;
	prev->next = next;
}

static void list_del(struct list_head *entry)
{
	__list_del(entry->prev, entry->next);
	entry->prev = NULL;
	entry->next = NULL;
}

static void list_del_init(struct list_head *entry)
{
	list_del(entry);
	INIT_LIST_HEAD(entry);
}

#ifdef __compiler_offsetof
#define offsetof(type, member) __compiler_offsetof(type, member)
#else
#define offsetof(type, member) ((size_t) &((type *)0)->member)
#endif

#define container_of(ptr, type, member) ({			\
	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
	(type *)( (char *)__mptr - offsetof(type,member) );})

#define list_entry(ptr, type, member) \
	container_of(ptr, type, member)

#define list_for_each(pos, head) \
	for (pos = (head)->next; pos != (head); pos = pos->next)

#define list_for_each_safe(pos, n, head) \
	for (pos = (head)->next, n = pos->next; pos != (head); pos = n, n = pos->next)

#define list_for_each_entry(pos, head, member)				\
	for (pos = list_entry((head)->next, typeof(*pos), member);	\
		&(pos)->member != (head);				\
		pos = list_entry(pos->member.next, typeof(*pos), member))

struct package;
struct dependency;

struct dependency {
	struct package *package;
	struct list_head list;
};

static struct dependency *dependency_create(struct package *package)
{
	struct dependency *dependency;

	dependency = malloc(sizeof(*dependency));
	if (!dependency)
		return NULL;

	memset(dependency, 0, sizeof(*dependency));
	dependency->package = package;
	INIT_LIST_HEAD(&dependency->list);

	return dependency;
}

static void dependency_destroy(struct dependency *dependency)
{
	free(dependency);
}

struct package {
	struct symbol *symbol;
	struct expr *depends;
	struct list_head list;
	struct list_head deps;
	unsigned long numdeps;
	unsigned long flags;
};

#define	PACKAGE_VIRTUAL		(1 << 0)

#define package_is_virtual(pkg)	(((pkg)->flags & PACKAGE_VIRTUAL) != 0)

static struct package *package_create(struct symbol *symbol, struct expr *depends)
{
	struct package *package = NULL;

	package = malloc(sizeof(*package));
	if (!package)
		return NULL;

	memset(package, 0, sizeof(*package));
	INIT_LIST_HEAD(&package->list);
	INIT_LIST_HEAD(&package->deps);
	package->symbol = symbol;
	package->depends = depends;

	return package;
}

static int package_destroy(struct package *package)
{
	struct list_head *node, *next;

	if (!package)
		return -EINVAL;

	list_for_each_safe(node, next, &package->deps) {
		struct dependency *dep = list_entry(node, struct dependency, list);
		dependency_destroy(dep);
	}

	free(package);
	return 0;
}

static int package_add_dependency(struct package *package, struct package *dep)
{
	struct dependency *d = dependency_create(dep);
	if (!d)
		return -ENOMEM;

	list_add_tail(&d->list, &package->deps);
	return 0;
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

static int expr_is_terminal(struct expr *child, struct expr *parent)
{
	/* TODO: refactor */
	if (child->type == E_SYMBOL) {
		if (child == parent->left.expr) {
			if (parent->right.expr->type == E_SYMBOL) {
				if (child->left.sym->name)
					return 1;
			}
		}

		if (child == parent->right.expr) {
			if (parent->left.expr->type == E_SYMBOL) {
				if (child->left.sym->name)
					return 1;
			}
		}
	}

	return 0;
}

static void build_package_deps_expr(struct list_head *packages, struct package *package, struct expr *expr)
{
	struct package *dep;

	switch (expr->type) {
	case E_AND:
	case E_OR:
		build_package_deps_expr(packages, package, expr->left.expr);
		build_package_deps_expr(packages, package, expr->right.expr);
		break;

	case E_SYMBOL:
		dep = find_package(packages, expr->left.sym);
		if (dep)
			package_add_dependency(dep, package);
		break;

	default:
		break;
	}
}

static void build_package_deps(struct list_head *packages, struct package *package)
{
	if (package->symbol->rev_dep.expr) {
		struct expr_value *rd = &package->symbol->rev_dep;
		build_package_deps_expr(packages, package, rd->expr);
	}
}

static void build_deps(struct list_head *packages)
{
	struct package *package;

	list_for_each_entry(package, packages, list)
		build_package_deps(packages, package);
}

static void resolve_virtual(struct list_head *packages, struct expr *expr);

static void resolve_terminal(struct list_head *packages, struct expr *child, struct expr *parent)
{
	struct package *package;

	if (expr_is_terminal(child, parent)) {
		package = find_package(packages, child->left.sym);
		if (package) {
			if (package_is_virtual(package)) {
				struct symbol *sym = package->symbol;
				struct expr *expr = sym->rev_dep.expr;
				resolve_virtual(packages, expr);
			}

			package->numdeps++;
		}
	}

	resolve_virtual(packages, child);
}

static void resolve_virtual(struct list_head *packages, struct expr *expr)
{
	if (!packages || !expr)
		return;

	switch (expr->type) {
	case E_AND:
	case E_OR:
		resolve_terminal(packages, expr->left.expr, expr);
		resolve_terminal(packages, expr->right.expr, expr);
		break;

	case E_SYMBOL:
		break;

	default:
		break;
	}
}

static void resolve_package_deps(struct list_head *packages, struct package *package)
{
	struct dependency *dep;

	list_for_each_entry(dep, &package->deps, list) {
		if (package_is_virtual(dep->package)) {
			struct symbol *sym = dep->package->symbol;
			struct expr *expr = sym->rev_dep.expr;
			resolve_virtual(packages, expr);
		}

		resolve_package_deps(packages, dep->package);
		dep->package->numdeps++;
	}
}

static void resolve_deps(struct list_head *packages)
{
	struct package *package;

	list_for_each_entry(package, packages, list)
		resolve_package_deps(packages, package);
}

static int symbol_is_package(struct symbol *symbol)
{
	if (!symbol || !symbol->name)
		return 0;

	if (strncmp(symbol->name, "PACKAGE_", 8) == 0)
		return 1;

	if (strncmp(symbol->name, "PLATFORM_", 9) == 0)
		return 1;

	if (strncmp(symbol->name, "VIRTUAL_", 8) == 0)
		return 1;

	return 0;
}

static struct package *package_create_from_menu(struct menu *menu)
{
	struct package *package = NULL;
	struct symbol *symbol = NULL;

	if (!menu)
		return NULL;

	symbol = menu->sym;

	sym_calc_value(symbol);

	switch (symbol->type) {
	case S_BOOLEAN:
	case S_TRISTATE:
		if (sym_get_tristate_value(symbol) == yes) {
			package = package_create(symbol, menu->dep);
			if (package) {
				if (strncmp(symbol->name, "VIRTUAL_", 8) == 0)
					package->flags |= PACKAGE_VIRTUAL;
			}
		}
		break;

	default:
		break;
	}

	return package;
}

static int create_package_list(struct list_head *head, struct menu *root)
{
	struct menu *menu = root->list;
	struct package *package;
	struct symbol *symbol;
	int ret = 0;

	if (!head || !root)
		return -EINVAL;

	while (menu) {
		symbol = menu->sym;

		if (symbol_is_package(symbol)) {
			package = package_create_from_menu(menu);
			if (package)
				list_add_tail(&package->list, head);
		}

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

int main(int argc, char *argv[])
{
	LIST_HEAD(packages);
	struct package *package;
	const char *name;
	FILE *fp = NULL;
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

	fp = fopen(depfile, "w");
	if (!fp) {
		fprintf(stderr, _("%s: failed to open file `%s': %s\n"),
				argv[0], depfile, strerror(errno));
		return 1;
	}

	ret = create_package_list(&packages, &rootmenu);
	if (ret < 0) {
		fprintf(stderr, _("failed to create package list\n"));
		fclose(fp);
		return 1;
	}

	build_deps(&packages);
	resolve_deps(&packages);
	list_sort(&packages);

	list_for_each_entry(package, &packages, list) {
		if (package_is_virtual(package))
			continue;

		fprintf(fp, _("CONFIG_%s=y\n"), package->symbol->name);
	}

	printf("#\n");
	printf("# package dependency list written to %s\n", depfile);
	printf("#\n");

	destroy_package_list(&packages);
	fclose(fp);
	return 0;
}
