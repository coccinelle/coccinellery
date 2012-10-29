//
// Eliminate kstrdup memory leak
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
