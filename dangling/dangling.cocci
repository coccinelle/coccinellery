//
//  Remove potential for use after free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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