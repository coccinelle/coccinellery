//
//  Use clk API instead of direct dereferences
//
// Target: Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression e,e1;
identifier i;
@@

*e = clk_get(...)
 ... when != e = e1
     when any
*e->i