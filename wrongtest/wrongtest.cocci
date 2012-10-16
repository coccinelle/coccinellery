//
// test the just-initialized value
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
identifier a,x,y,f!={PTR_ERR,ERR_PTR,ERR_CAST};
statement S;
@@

(
a = f(...,&x,...);
if (\(x == NULL\|IS_ERR(x)\)) S
|
x = f(...);
(
if (\(x == NULL\|IS_ERR(x)\)) S
|
*if (\(y == NULL\|IS_ERR(y)\))
 { ... when != x
   return ...; }
)
)