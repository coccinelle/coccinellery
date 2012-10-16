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