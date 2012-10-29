//
// Remove potential for use after free
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression e,e1,e2,e3;
identifier f,free1,free2;
expression a;
@@

*e->f = a
... when != e->f = e1
    when any
if (...) {
  ... when != free1(...,e,...)
      when != e->f = e2
* kfree(a)
  ... when != free2(...,e,...)
      when != e->f = e3
}