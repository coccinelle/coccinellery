//
// Correct NULL test
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
expression *x;
expression e;
identifier l;
position p2,p3;
@@

if (x@p3 == NULL || ...) {
    ... when forall
    return ...; }
... when != goto l;
    when != x = e
    when != &x
x@p2 == NULL

@single@
position r.p2 != r.p3;
expression x;
@@

x@p2 == NULL

@ok depends on single@
expression *x;
position any r.p3;
position r.p2;
statement S;
@@

... when != x@p3 == NULL
x@p2 == NULL

@depends on !ok && single@
position r.p2,r.p3;
expression *x;
@@

*x@p3 == NULL
...
*x@p2 == NULL