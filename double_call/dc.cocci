//
// Eliminate useless code
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@a forall@
idexpression *x;
identifier f != ERR_PTR;
position p1,p2;
@@

x@p1 = f(...)
... when != x
(
x = f(...,<+...x...+>,...)
|
x@p2 = f(...)
)

@script:python@
p1 << a.p1;
p2 << a.p2;
@@

if (p1[0].line == p2[0].line):
  cocci.include_match(False)

@@
idexpression *x;
identifier f;
position a.p1,a.p2;
@@

*x@p1 = f(...)
...
*x@p2 = f(...)
