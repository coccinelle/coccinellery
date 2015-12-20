@@
expression x,e;
@@

* x = \(vmalloc\|kmalloc\|kzalloc\|kcalloc\|kmem_cache_alloc\|krealloc\|
        kmemdup\|devm_kzalloc\|devm_kmalloc\|devm_kcalloc\|devm_kasprintf\|
	kmalloc_array\)(...)
... when != x = e
* IS_ERR_OR_NULL(x)
