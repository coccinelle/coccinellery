//
//  Convert IS_ERR result to PTR_ERR
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression x;
@@

 if (...) { ...
- return IS_ERR(x);
+ return PTR_ERR(x);
}
