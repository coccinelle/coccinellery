//
//  Test the just-initialized value
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
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