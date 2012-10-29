//
// Move dereferences below a NULL test
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

// Copyright: (C) 2009 Gilles Muller, Julia Lawall, INRIA, DIKU.  GPLv2.

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
  BUG_ON (E == NULL);
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
  BUG_ON (E == NULL);
+ i = E->fld;
)
