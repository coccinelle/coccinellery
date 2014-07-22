//
//  Eliminate kstrdup memory leak
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
local idexpression x;
expression E;
identifier l;
statement S;
@@

*x= \(kasprintf\|kstrdup\)(...);
...
if (x == NULL) S
... when != kfree(x)
    when != E = x
if (...) {
  <... when != kfree(x)
* goto l;
  ...>
* return ...;
}
