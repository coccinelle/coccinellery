//
//  Free kmem_cache_zalloc'd data using kmem_cache_free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression x,e,e1,e2;
@@

x = \(kmem_cache_alloc\|kmem_cache_zalloc\)(e1,e2)
... when != x = e
?-kfree(x)
+kmem_cache_free(e1,x)


@r@
type T;
T *e;
identifier f;
expression e1,e2;
@@

e->f = \(kmem_cache_alloc\|kmem_cache_zalloc\)(e1,e2)

@@
r.T *e;
identifier r.f;
expression r.e1;
@@
-kfree(e->f)
+kmem_cache_free(e1,e->f)