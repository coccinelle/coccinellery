//
//  Add missing of_node_put
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
identifier x;
@@

of_node_put(x)

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
if (...) { ... when != of_node_put(x)
               when != if (...) { ... of_node_put(x); ... }
               when != x = E3
               when != E3 = x
*  return ...;
 }
... when != x = E2
    when != I(...,x,...) S
    when != &x
if (...) { ... when != x = E4
 of_node_put(x); ... return ...; }
)
