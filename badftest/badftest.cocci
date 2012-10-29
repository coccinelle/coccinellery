//
// Description not available
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Author name not available
//

@r@
identifier f;
@@

f(...) { <+... return NULL; ...+> }

@@
expression *x;
expression y;
identifier r.f;
statement S;
@@

x = f(...);
(
if ((x) == NULL) S
|
if (
-   y
+   x
       == NULL)
 S
)
