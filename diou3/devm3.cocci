//
// some devm_ cleanups
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@exists@
@@

if (...) {
 ... when any
(
- devm_kfree(...);
|
- devm_free_irq(...);
|
- devm_iounmap(...);
|
- devm_release_region(...);
|
- devm_release_mem_region(...);
)
 ... when any
 return ...;
}

@@
identifier f;
@@

f(...) { ... when any
(
- devm_kfree(...);
|
- devm_free_irq(...);
|
- devm_iounmap(...);
|
- devm_release_region(...);
|
- devm_release_mem_region(...);
)
 ... when any
 return 0;
}

