//
// use list_for_each_entry
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
struct list_head *pos;
struct list_head *head;
statement S;
@@

*for (pos = (head)->next; pos != (head); pos = pos->next)
S