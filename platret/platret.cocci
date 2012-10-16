//
// failure test for null rather than negative integer
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression x,e;
statement S1,S2;
@@

*x = dev_get_platdata(...)
... when != x = e
*if (x < 0) S1 else S2