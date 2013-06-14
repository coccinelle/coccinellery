//
//  Use list_for_each_entry
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
struct list_head *pos;
struct list_head *head;
statement S;
@@

*for (pos = (head)->next; pos != (head); pos = pos->next)
S