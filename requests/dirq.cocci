//
//  use devm_kzalloc and devm_clk_get
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

/*@exists@
expression e1,e2,x,a,b,c,d,e3,e4;
identifier l;
statement S;
@@

- e3 = devm_request_irq(e1,
+ request_irq(
  e2,...,x);
  ... when != e3 = e4
  if (e3 == 0) { ... goto l; }
  ... when any
+ free_irq(e2,x);
  l:

*/
@r exists@
expression e1,e2,x,a,b,c,d;
identifier free;
position p1,p2;
@@

  devm_request_irq@p1(e1,e2,...,x)
  ... when any
      when != e2 = a
      when != x = b
  if (...) {
    ... when != e2 = c
        when != x = d
    free@p2(...,x,...);
    ...
    return ...;
  }

@@
position r.p1,r.p2;
expression r.e1,r.e2,r.x;
identifier free;
@@

(
+ free_irq(e2,x);
  free@p2(...,x,...);
|
- devm_request_irq@p1(e1,
+ request_irq(
    e2,...,x)
)
