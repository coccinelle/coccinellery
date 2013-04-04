//
//  Eliminate double free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@w@
position p;
@@

while (1) { <... kfree@p(...); ...> }

@r@
identifier E;
expression E1;
position p1!=w.p,p2;
iterator I;
statement S;
@@

kfree@p1(E);
... when != E = E1
    when != I(E,...) S
    when != &E
kfree@p2(E);

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].line == p2[0].line):
  cocci.include_match(False)

@@
identifier E;
expression E1;
position r.p1,r.p2;
@@

*kfree@p1(E);
...
*kfree@p2(E);
