//
//  Drop devm_kfree of devm_kzalloc'd data
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression x,d;
@@

x = devm_kzalloc(...)
...
?-devm_kfree(d,x);