//
// drop iounmap for devm_ allocated data
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
expression x;
@@

(
 x = devm_kzalloc(...)
|
 x = devm_request_irq(...)
|
 x = devm_ioremap(...)
|
 x = devm_ioremap_nocache(...)
)

@@
expression r.x;
@@

(
* kfree(x)
|
* free_irq(x)
|
* iounmap(x)
)