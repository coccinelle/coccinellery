//
// initialize return variable with error code
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
