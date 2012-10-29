//
// eliminate NULL dereference
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression dev,E;
@@

*dev_name(dev)
... when != dev = E
(
*dev == NULL
|
*dev != NULL
)