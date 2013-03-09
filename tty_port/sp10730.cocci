//
//  Put correct tty value
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@rule10730 exists@
local idexpression struct tty_struct * x;
expression ra,rr;
identifier fa;
position p1,p2;
statement S1,S2;
@@

x = tty_port_tty_get@p1(...)
... when != x = rr
    when != fa(...,x,...)
    when any
    when != true x == NULL
     when != true ERR_PTR(x)
     when != tty_kref_put(x,...)
     when != if (...) { ... tty_kref_put(x,...) ...}
(
if(<+...x...+>) S1 else S2
|
if(...) { ... when != x = ra
      when forall
     when != tty_kref_put(x,...)
return@p2...; }
)

@script:python@
p1 << rule10730.p1;
p2 << rule10730.p2;
@@

cocci.print_main("10730: tty_port_tty_get: tty_kref_put",p1)
cocci.print_secs("",p2)

