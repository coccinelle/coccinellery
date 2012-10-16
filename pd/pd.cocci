//
// Invert calls to platform_device_put and platform_device_del
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression e1,e2;
@@

*platform_device_put(e1);
... when != e1 = e2
*platform_device_del(e1);