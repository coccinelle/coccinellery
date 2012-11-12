//
// drop if around WARN_ON
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression e;
@@

(
if(<+...e(...)...+>) WARN_ON(1);
|
- if (e) WARN_ON(1);
+ WARN_ON(e);
)

@@
expression e;
@@

(
if(<+...e(...)...+>) WARN_ON_ONCE(1);
|
- if (e) WARN_ON_ONCE(1);
+ WARN_ON_ONCE(e);
)