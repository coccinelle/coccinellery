//
// 
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: 
//

@expression@
expression *x;
@@

x =
 <+...
-sizeof(x)
+sizeof(*x)
...+>