//
//  Add missing of_node_put
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression e,e1,e2;
@@

*e = of_parse_phandle(...)
... when != of_node_put(e)
    when != true e == NULL
    when != e2 = e
e = e1