//
// Convert release_resource to release_region/release_mem_region
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression x,E;
@@

(
*x = request_region(...)
|
*x = request_mem_region(...)
)
... when != release_region(x)
    when != release_mem_region(x)
    when != x = E
* release_resource(x);
