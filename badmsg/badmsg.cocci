//
// Return -ENOMEM on memory allocation failure
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
identifier f;
expression ret;
expression x,e1,e2,e3;
position p;
@@

f(...) { <...
ret = 0
... when != ret = e1
x@p = \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != ret = e2
if (x == NULL) { ... when != ret = e3
  return ret;
}
...>
}

@ok@
identifier r.f;
expression r.ret;
constant C;
@@

f(...) { <+...
(
 return -C;
|
 if (ret) { ... return ret; }
|
 ret = -C
)
...+> }

@depends on ok@
position r.p;
expression r.x;
@@

*x@p = \(kmalloc\|kcalloc\|kzalloc\)(...)
