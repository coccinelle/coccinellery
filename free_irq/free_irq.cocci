//
//  Reposition free_irq to avoid access to invalid data
//
// Target: Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// Target: Linux

@fn exists@
expression list es;
expression a,b;
identifier f;
@@

if (...) {
  ... when any
  free_irq(a,b);
  ... when any
  f(es);
  ... when any
  return ...;
}

@@
expression list fn.es;
expression fn.a,fn.b;
identifier fn.f;
@@

*f(es);
... when any
*free_irq(a,b);
