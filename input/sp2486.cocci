//
//  Correct call to input_free_device
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@rule2486 exists@
local idexpression struct input_dev * x;
expression ra,rr;
identifier fa;
position p1,p2;
int i;
statement S1,S2;
@@

x = input_allocate_device@p1(...)
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
p1 << rule2486.p1;
p2 << rule2486.p2;
@@

cocci.print_main("2486: input_allocate_device: input_free_device",p1)
cocci.print_secs("",p2)

