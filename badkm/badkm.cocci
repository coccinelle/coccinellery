//
//  Initialize return variable with error code
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
identifier ret,f;
expression E,E1,x;
@@

(
ret = f(...);
if (ret != 0) { ... when forall
  return ...; }
|
ret = 0
)
... when != ret = E
    when any
x = \(kmalloc\|kzalloc\|kcalloc\)(...);
*if(x == NULL) {
 ... when != ret = E1
* return ret;
}
