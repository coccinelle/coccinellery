//
//  Correct call to input_free_device
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@rule2506 exists@
local idexpression struct input_dev * x;
expression rb,nb,ra,rr;
identifier fb,fldb,fa;
position p1,p2;
int i;
statement S1,S2;
identifier f1, f2, f3;
expression r1, r2, r3;
expression n1, n2, n3;
identifier fld1, fld2, fld3;
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
input_set_drvdata(x,...)
...  when != x = r3
    when != f3(...,x,...)
  when != n3->fld3 = x
 when != *n3 = x
input_register_device(x,...)
...  when != x = rr
     when != fa(...,x,...)
     when any
     when != true x == NULL
     when != true IS_ERR(x)
     when != true IS_ERR_OR_NULL(x)
     when != input_free_device(x,...)
     when != if (...) { ... input_free_device(x,...) ...}
(
if(<+... i == 0 ...+>) S1
|
if(<+...x...+>) S1 else S2
|
if(...) { ... when != x = ra
     when forall
     when != input_free_device(x,...)
 \(return <+...x...+>; \| return@p2...; \) }
)

@script:python@
p1 << rule2506.p1;
p2 << rule2506.p2;
@@

cocci.print_main("2506: input_allocate_device: input_free_device",p1)
cocci.print_secs("",p2)

