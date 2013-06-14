//
//  Correct call to input_free_device
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@double_assign@
expression e1,e2;
position p;
@@

e1 = e2 = input_allocate_device@p(...)

@rule2495 exists@
local idexpression struct input_dev * x;
expression rb,nb,ra,rr,na;
identifier fb,fldb,fa,flda;
position p1!=double_assign.p,p2;
int i;
statement S1,S2;
identifier f1, f2;
expression r1, r2;
expression n1, n2;
identifier fld1, fld2;
@@

x = input_allocate_device@p1(...)
...  when != x = rb
     when != fb(...,x,...)
     when != nb->fldb = x
     when != *nb = x
input_set_abs_params(x,...)
...  when != x = r1
     when != f1(...,x,...)
     when != n1->fld1 = x
     when != *n1 = x
input_set_abs_params(x,...)
...  when != x = r2
     when != f2(...,x,...)
     when != n2->fld2 = x
     when != *n2 = x
input_register_device(x,...)
...  when != x = ra
     when != fa(...,x,...)
     when != na->flda = x
     when != *na = x
     when any
     when != true x == NULL
     when != true IS_ERR(x)
     when != true IS_ERR_OR_NULL(x)
     when != input_free_device(x,...)
     when != if (...) { ... input_free_device(x,...) ...}
(
if(<+... \(i == 0\| IS_ERR(...) == 0\) ...+>) S1
|
if(<+...x...+>) S1 else S2
|
if(...) { ... when != x = rr
     when forall
     when != input_free_device(x,...)
 \(return <+...x...+>; \| return@p2...; \) }
)

@script:python@
p1 << rule2495.p1;
p2 << rule2495.p2;
@@

cocci.print_main("2495: input_allocate_device: input_free_device",p1)
cocci.print_secs("",p2)

