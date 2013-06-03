@@
struct list_head *pos;
struct list_head *head;
statement S;
@@

*for (pos = (head)->next; pos != (head); pos = pos->next)
S