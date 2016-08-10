//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
