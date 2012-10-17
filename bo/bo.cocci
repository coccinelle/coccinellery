//
// trivial: use BUG_ON
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
identifier x;
@@

-if (x) BUG();
+BUG_ON(x);

@@
identifier x;
@@

-if (!x) BUG();
+BUG_ON(!x);

