//
// add missing of_node_put
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression e,e1,e2;
@@

*e = of_parse_phandle(...)
... when != of_node_put(e)
    when != true e == NULL
    when != e2 = e
e = e1