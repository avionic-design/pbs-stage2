#ifndef LIST_H
#define LIST_H 1

/* for offsetof() macro */
#include <stddef.h>

#define container_of(ptr, type, member) ({				\
		const typeof(((type *)0)->member) *__mptr = (ptr);	\
		(type *)((char *)__mptr - offsetof(type, member));	\
	})

struct list_head {
	struct list_head *prev;
	struct list_head *next;
};

#define LIST_HEAD_INIT(name) { &(name), &(name) }

#define LIST_HEAD(name) \
	struct list_head name = LIST_HEAD_INIT(name)

static inline void INIT_LIST_HEAD(struct list_head *list)
{
	list->prev = list;
	list->next = list;
}

static inline void __list_add(struct list_head *node,
			      struct list_head *prev,
			      struct list_head *next)
{
	next->prev = node;
	node->next = next;
	node->prev = prev;
	prev->next = node;
}

static inline void __list_del(struct list_head *prev, struct list_head *next)
{
	next->prev = prev;
	prev->next = next;
}

static inline void list_add(struct list_head *node, struct list_head *head)
{
	__list_add(node, head, head->next);
}

static inline void list_add_tail(struct list_head *node, struct list_head *head)
{
	__list_add(node, head->prev, head);
}

static inline void list_del(struct list_head *node)
{
	__list_del(node->prev, node->next);
	node->next = NULL;
	node->prev = NULL;
}

static inline int list_empty(const struct list_head *head)
{
	return head->next == head;
}

#define list_entry(ptr, type, member) \
	container_of(ptr, type, member)

#define list_for_each(pos, head) \
	for (pos = (head)->next; pos != (head); pos = pos->next)

#define list_for_each_prev(pos, head) \
	for (pos = (head)->prev; pos != (head); pos = pos->prev)

#define list_for_each_safe(pos, n, head) \
	for (pos = (head)->next, n = pos->next; pos != (head); pos = n, n = pos->next)

#define list_for_each_prev_safe(pos, n, head) \
	for (pos = (head)->prev, n = pos->prev; pos != (head); pos = n, n = pos->prev)

#define list_for_each_entry(pos, head, member) \
	for (pos = list_entry((head)->next, typeof(*pos), member);	\
	     &pos->member != (head);					\
	     pos = list_entry(pos->member.next, typeof(*pos), member))

#define list_for_each_entry_reverse(pos, head, member) \
	for (pos = list_entry((head)->prev, typeof(*pos), member);	\
	    &pos->member != (head);					\
	    pos = list_entry(pos->member.prev, typeof(*pos), member))

#define list_for_each_entry_safe(pos, n, head, member) \
	for (pos = list_entry((head)->next, typeof(*pos), member),	\
		n = list_entry(pos->member.next, typeof(*pos), member);	\
	     &pos->member != (head);					\
	     pos = n, n = list_entry(n->member.next, typeof(*n), member))

#define list_for_each_entry_safe_reverse(pos, n, head, member) \
	for (pos = list_entry((head)->prev, typeof(*pos), member),	\
		n = list_entry(pos->member.prev, typeof(*pos), member);	\
	     &pos->member != (head);					\
	     pos = n, n = list_entry(n->member.prev, typeof(*n), member))

#endif /* !LIST_H */

