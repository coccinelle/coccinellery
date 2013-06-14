//
//  Add missing free_domain_mem
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@km exists@
identifier virtual.kmalloc;
identifier kfree;
local idexpression e;
expression e1,e2,e3;
position p1,p2,p3;
statement S;
type T,T1;
identifier f;
@@

e@p1 = kmalloc(...)
... when any
    when != if (e) kfree(e);
    when != e = e1
    when != e1 = (T)e
    when != e1(...,(T)e,...)
    when != &e->f
    when != true (unlikely(\(e == NULL\|e == 0\)) || ...)
(
if (unlikely(\(e == NULL\|e == 0\)) || ...) S
|
if(...)@p2 { ... when != e2(...,(T1)e,...)
                 when != e3 = e
                 when forall
(
             return <+...e...+>;
|
             return@p3 ...;
) }
)

@script:ocaml@
p1 << km.p1;
p2 << km.p2;
p3 << km.p3;
@@

    Coccilib.print_main ("kmalloc: "^((List.hd p1).current_element)) p1;
    Coccilib.print_secs "" p2;
    Coccilib.print_secs ~color:("ovl-face3") "" p3
