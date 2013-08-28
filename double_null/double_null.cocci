//
//  Correct NULL test
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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