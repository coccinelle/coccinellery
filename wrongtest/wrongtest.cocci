//
//  Test the just-initialized value
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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