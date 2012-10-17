//
// Adjust NULL test
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression E,E1;
identifier f,fld,fld1;
statement S1,S2;
@@

E->fld = f(...);
... when != E = E1
    when != E->fld1 = E1
if (
-   E
+   E->fld
           == NULL) S1 else S2
