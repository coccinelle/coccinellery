//
//  Convert release_resource to release_region/release_mem_region
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
expression e1,e2,e3,e4;
position p1,p2;
@@

e4 = request_mem_region@p1(e1,e2,e3)
...
?release_resource@p2(e4);

@script:python r1@
p1 << r.p1;
p2 << r.p2;
@@

@depends on r1@
position r.p1, r.p2;
expression e1,e2,e3;
@@

(
- request_mem_region@p1(e1,e2->end-e2->start+1,e3)
+ request_mem_region(e1,resource_size(e2),e3)
|
- release_mem_region@p2(e1,e2->end-e2->start+1)
+ release_mem_region(e1,resource_size(e2))
)

@s exists@
expression e1,e2,e3,e4;
@@

e4 = request_mem_region(e1,e2,e3)
...
-release_resource(e4);
+release_mem_region(e1,e2);
?-kfree(e4);

@@
expression r.e4;
@@

- release_resource(e4);
+ release_mem_region(e4->start,resource_size(e4));
?-kfree(e4);
