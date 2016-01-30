//
//  Add missing of_node_put
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
struct device_node *n;
struct device_node *n1;
statement S;
identifier f;
expression E;
constant C;
@@

n = of_find_node_by_name(...)
... 
if (!n) S
... when != of_node_put(n)
    when != n1 = f(n,...)
    when != E = n
    when any
    when strict
(
+ of_node_put(n);
  return -C;
|
  of_node_put(n);
|
  n1 = f(n,...)
|
  E = n
|
  return ...;
)
