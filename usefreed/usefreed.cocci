//
// Correct use after free
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
expression x,e;
identifier f;
iterator I;
statement S;
position p1,p2;
@@

kfree@p1(x);
... when != &x
    when != x = e
    when != I(x,...) S
x@p2->f

@bad@
position r.p1,r.p2;
expression x,e;
identifier i;
iterator I;
statement S;
@@

kfree@p1(<+...i...+>);
... when != x@p2->f
(
I(i,...) S
|
&i
|
i=e
)

@depends on !bad@
expression x;
identifier f;
position r.p1,r.p2;
@@

*kfree@p1(x);
...
*x@p2->f
