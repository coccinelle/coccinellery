//
//  Remove invalid reference to list iterator variable
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
identifier c,member;
expression E,x;
iterator name list_for_each_entry;
iterator name list_for_each_entry_reverse;
iterator name list_for_each_entry_continue;
iterator name list_for_each_entry_continue_reverse;
iterator name list_for_each_entry_from;
iterator name list_for_each_entry_safe;
iterator name list_for_each_entry_safe_continue;
iterator name list_for_each_entry_safe_from;
iterator name list_for_each_entry_safe_reverse;
iterator name hlist_for_each_entry;
iterator name hlist_for_each_entry_continue;
iterator name hlist_for_each_entry_from;
iterator name hlist_for_each_entry_safe;
statement S;
@@

(
list_for_each_entry(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_reverse(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_continue(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_continue_reverse(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_from(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_safe(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_safe_continue(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_safe_from(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
|
list_for_each_entry_safe_reverse(c,...,member) { ... when != break;
                                 when forall
                                 when strict
}
)
...
(
list_for_each_entry(c,...) S
|
list_for_each_entry_reverse(c,...) S
|
list_for_each_entry_continue(c,...) S
|
list_for_each_entry_continue_reverse(c,...) S
|
list_for_each_entry_from(c,...) S
|
list_for_each_entry_safe(c,...) S
|
list_for_each_entry_safe(x,c,...) S
|
list_for_each_entry_safe_continue(c,...) S
|
list_for_each_entry_safe_continue(x,c,...) S
|
list_for_each_entry_safe_from(c,...) S
|
list_for_each_entry_safe_from(x,c,...) S
|
list_for_each_entry_safe_reverse(c,...) S
|
list_for_each_entry_safe_reverse(x,c,...) S
|
hlist_for_each_entry(c,...) S
|
hlist_for_each_entry_continue(c,...) S
|
hlist_for_each_entry_from(c,...) S
|
hlist_for_each_entry_safe(c,...) S
|
list_remove_head(x,c,...)
|
sizeof(<+...c...+>)
|
&c->member
|
c = E
|
*c
)
