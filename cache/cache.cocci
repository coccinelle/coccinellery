//
//  Use kmem_cache_free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression x,E,c;
@@

 x = \(kmem_cache_alloc\|kmem_cache_zalloc\|kmem_cache_alloc_node\)(c,...)
 ... when != x = E
     when != &x
?-kfree(x)
+kmem_cache_free(c,x)
