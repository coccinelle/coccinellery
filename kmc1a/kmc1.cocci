//
// eliminate NULL pointer dereference
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression x,e,e1,e2;
@@

x = \(kmem_cache_alloc\|kmem_cache_zalloc\)(e1,e2)
... when != x = e
?-kfree(x)
+kmem_cache_free(e1,x)

@@
expression x,e,e1,e2,e3;
@@

x = \(kmem_cache_alloc\|kmem_cache_zalloc\)(e1,e2)
... when != x = e
(
kmem_cache_free(e1,x);
|
?-kmem_cache_free(e3,x);
+kmem_cache_free(e1,x);
)

@exists@
expression x,e,e1,e2,e3;
@@

x = \(kmem_cache_alloc\|kmem_cache_zalloc\)(e1,e2);
... when != x
(
return <+...x...+>;
|
+kmem_cache_free(e1,x);
return ...;
)


