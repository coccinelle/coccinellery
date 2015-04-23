//
//  Fix error return code
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
identifier ret,l;
expression e1,e2,e3;
statement S;
@@

if (ret < 0)
 { ... return ret; }
... when != ret = e1
    when forall
(
 goto l;
|
 return ...;
|
 if (<+... ret = e3 ...+>) S
|
*if(...)
 {
  ... when != ret = e2
* return ret;
}
)
