//
//  Take size of pointed value, not pointer
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression *e;
type T;
identifier f;
@@

f(...,
-sizeof(e)
+sizeof(*e)
,...,(T)e,...)

@@
expression *e;
type T;
identifier f;
@@

f(...,(T)e,...,
-sizeof(e)
+sizeof(*e)
,...)
