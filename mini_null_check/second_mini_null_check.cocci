//
//  Drop an unneeded a NULL test
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E=E1
      when != i
(
  if (E == NULL||
-     i
+     E->fld
       == NULL || ...) S
+ i = E->fld;
|
  BUG_ON (E == NULL||
-     i
+     E->fld
       == NULL || ...);
+ i = E->fld;
)

@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E=E1
      when != i
(
  if (E == NULL||...) S
+ i = E->fld;
|
  BUG_ON (E == NULL||...);
+ i = E->fld;
)
