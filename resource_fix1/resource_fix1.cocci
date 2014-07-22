//
//  Convert release_resource to release_mem_region
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@res exists@
expression x;
@@

(
x = request_region(x->start,...)
|
x = request_mem_region(x->start,...)
)
... when != release_region(x->start,...)
    when != release_mem_region(x->start,...)
    when != x = E
release_resource(x);

@a@
expression res.x,E;
@@

x = request_region(...)
... when != release_region(x->start,...)
    when != x = E
(
- release_resource(x);
- kfree(x);
+  release_region(x->start,resource_size(x));
|
?- release_resource(x);
+  release_region(x->start,resource_size(x));
)

@depends on a@
expression res.x;
@@

- release_resource(x);
?- kfree(x);
+  release_region(x->start,resource_size(x));

@b@
expression res.x,E;
@@

x = request_mem_region(...)
... when != release_mem_region(x->start,...)
    when != x = E
(
- release_resource(x);
- kfree(x);
+  release_mem_region(x->start,resource_size(x));
|
?- release_resource(x);
+  release_mem_region(x->start,resource_size(x));
)

@depends on b@
expression res.x;
@@

- release_resource(x);
?- kfree(x);
+  release_mem_region(x->start,resource_size(x));

@depends on a || b@
expression res.x;
@@

(
- x->end - x->start + 1
+ resource_size(x)
|
- x->end + 1 - x->start
+ resource_size(x)
|
- 1 + x->end - x->start
+ resource_size(x)
)
