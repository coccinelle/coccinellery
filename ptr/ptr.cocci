//
// Correct error handling code
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression E,E1;
@@

if (
-   E == NULL
+   IS_ERR(E)
   ) { <+... when != E = E1
        PTR_ERR(E)
       ...+> }
