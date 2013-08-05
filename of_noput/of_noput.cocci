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
type T;
identifier d;
expression e;
@@

T *d;
...
while ((d = of_find_all_nodes(d)) != NULL)
 {... when != of_node_put(d)
      when != e = d
(
   return d;
|
+  of_node_put(d);
?  return ...;
)
...}

@@
identifier d;
type T;
expression e, e1;
@@

T *d;
...
while ((d = of_find_all_nodes(d)) != NULL)
  {... when != of_node_put(d)
       when != e = d
+ of_node_put(d);
? break;
  ...}
... when != of_node_put(d)
    when != e1 = d
    when != return d;

@@
type T;
identifier d;
expression e;
@@

T *d;
...
for (d = NULL; (d = of_find_all_nodes(d)) != NULL; )
 {... when != of_node_put(d)
      when != e = d
(
   return d;
|
+  of_node_put(d);
?  return ...;
)
...}

@@
identifier d;
type T;
expression e, e1;
@@

T *d;
...
for (d = NULL; (d = of_find_all_nodes(d)) != NULL; )
  {... when != of_node_put(d)
       when != e = d
+ of_node_put(d);
? break;
  ...}
... when != of_node_put(d)
    when != e1 = d
    when != return d;
