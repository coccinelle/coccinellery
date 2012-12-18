//
//  Invert calls to platform_device_put and platform_device_del
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression e1,e2;
@@

*platform_device_put(e1);
... when != e1 = e2
*platform_device_del(e1);