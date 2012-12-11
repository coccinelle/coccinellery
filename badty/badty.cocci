//
//  Correct the size argument to kzalloc
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@disable sizeof_type_expr@
type T;
T **x;
@@

  x =
  <+...sizeof(
- T
+ *x
  )...+>
