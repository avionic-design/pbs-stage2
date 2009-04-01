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
#include "list.h"
#include "lkc.h"

struct symbol_list {
	struct list_head list;
	struct symbol *sym;
	unsigned long deps;
};

int symbol_list_add_tail(struct symbol_list **list, struct symbol *sym)
{
	struct symbol_list *entry;

	if (!list || !sym)
		return -EINVAL;

	entry = malloc(sizeof(*entry));
	if (!entry)
		return -ENOMEM;

	INIT_LIST_HEAD(&entry->list);
	entry->sym = sym;
	entry->deps = 0;

	if (*list)
		list_add_tail(&entry->list, &(*list)->list);
	else
		*list = entry;

	return 0;
}

struct symbol_list *symbol_list_create(struct menu *root)
{
	struct menu *menu = root->list;
	struct symbol_list *ret = NULL;
	struct symbol *sym;
	struct expr *e;
	int indent = 0;

	while (menu) {
		sym = menu->sym;

		if (sym && !(sym->flags & SYMBOL_CHOICE)) {
			sym_calc_value(sym);

			switch (sym->type) {
			case S_BOOLEAN:
			case S_TRISTATE:
				switch (sym_get_tristate_value(sym)) {
				case no:
					break;
				case mod:
					break;
				case yes:
					(void)symbol_list_add_tail(&ret, sym);
					break;
				}
				break;
			}
		}

		if (menu->list) {
			menu = menu->list;
			indent += 2;
			continue;
		}

		if (menu->next) {
			menu = menu->next;
		} else {
			while ((menu = menu->parent)) {
				indent -= 2;

				if (menu->next) {
					menu = menu->next;
					break;
				}
			}
		}
	}

	return ret;
}

int dump_expr(struct expr *e, int indent)
{
	int ret = 0;

	//printf("> %s(e=%p, indent=%d)\n", __func__, e, indent);

	if (!e) {
		ret = -EINVAL;
		goto out;
	}

	switch (e->type) {
	case E_NONE:
		printf("NONE\n");
		break;

	case E_OR:
		dump_expr(e->left.expr, indent + 2);
		printf("%*sOR\n", indent, "");
		dump_expr(e->right.expr, indent + 2);
		break;

	case E_AND:
		dump_expr(e->left.expr, indent + 2);
		printf("%*sAND\n", indent, "");
		dump_expr(e->right.expr, indent + 2);
		break;

	case E_SYMBOL:
		printf("%*s[%s]\n", indent, "", e->left.sym);
		break;

	default:
		printf("%d\n", e->type);
		break;
	}

out:
	//printf("< %s() = %d\n", __func__, ret);
	return ret;
}

int symbol_list_order(struct symbol_list *list)
{
	struct symbol_list *entry;
	int ret = 0;

	printf("> %s(list=%p)\n", __func__, list);

	list_for_each_entry(entry, &list->list, list) {
		printf("symbol: %p [%s]\n", entry->sym, entry->sym->name);
		dump_expr(entry->sym->rev_dep.expr, 0);
	}

	printf("< %s() = %d\n", __func__, ret);
	return ret;
}

int main(int argc, char *argv[])
{
	struct symbol_list *list;
	struct symbol_list *entry;
	const char *name;
	int opt;
	int i;

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

	list = symbol_list_create(&rootmenu);

	list_for_each_entry(entry, &list->list, list) {
		printf(_("symbol: %s\n"), entry->sym->name);
		printf(_("  deps: %lu\n"), entry->deps);
	}

	symbol_list_order(list);

	list_for_each_entry(entry, &list->list, list) {
		printf(_("symbol: %s\n"), entry->sym->name);
		printf(_("  deps: %lu\n"), entry->deps);
	}

	return 0;
}

