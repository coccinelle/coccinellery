//
//  Adjust error handling code involving capi_ctr_put
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
expression x,E;
statement S;
position p1,p2,p3;
@@

(
if ((x = capi_ctr_get@p1(...)) == NULL || ...) S
|
x = capi_ctr_get@p1(...)
... when != x
if (x == NULL || ...) S
)
<...
if@p3 (...) { ... when != capi_ctr_put(x)
                  when != if (x) { ... capi_ctr_put(x); ...}
    return@p2 ...;
}
...>
(
return x;
|
return 0;
|
x = E
|
E = x
|
capi_ctr_put(x)
)

@exists@
position r.p1,r.p2,r.p3;
expression x;
int ret != 0;
statement S;
@@

* x = capi_ctr_get@p1(...)
  <...
* if@p3 (...)
  S
  ...>
* return@p2 \(NULL\|ret\);
