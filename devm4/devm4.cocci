//
//  Drop iounmap for devm_ allocated data
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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