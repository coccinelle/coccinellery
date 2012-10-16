//
// drop devm_kfree of devm_kzalloc'd data
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression x,d;
@@

x = devm_kzalloc(...)
...
?-devm_kfree(d,x);