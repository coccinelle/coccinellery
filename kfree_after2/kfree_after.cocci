//
// avoid missing kfree
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
identifier x;
@@

kfree(x)

@@
identifier r.x;
expression E1!=0,E2,E3,E4,y;
statement S;
iterator I;
@@

(
if (x==NULL || ...) S
|
if (IS_ERR(x) || ...) S
|
if ((x=y)==NULL || ...) S
|
if (...) { ... when != kfree(x)
               when != if (...) { ... kfree(x); ... }
               when != x = E3
               when != E3 = x
*  return ...;
 }
... when != x = E2
    when != I(...,x,...) S
if (...) { ... when != x = E4
 kfree(x); ... return ...; }
)
