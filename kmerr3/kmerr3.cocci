@@
expression x,y;
identifier fld;
@@

(
x = \(vmalloc\|kmalloc\|kzalloc\|kcalloc\|kmem_cache_alloc\|krealloc\|
        kmemdup\|kstrdup\|
	devm_kzalloc\|devm_kmalloc\|devm_kcalloc\|devm_kasprintf\|
	kmalloc_array\)(...,<+... __GFP_NOFAIL ...+>,...);
|
* x = \(vmalloc\|kmalloc\|kzalloc\|kcalloc\|kmem_cache_alloc\|krealloc\|
        kmemdup\|kstrdup\|
	devm_kzalloc\|devm_kmalloc\|devm_kcalloc\|devm_kasprintf\|
	kmalloc_array\)(...);
)
  ... when != (x) == NULL
      when != (x) != NULL
      when != (x) == 0
      when != (x) != 0
      when != x = y
(
  x->fld
|
  *x
|
  x[...]
)
