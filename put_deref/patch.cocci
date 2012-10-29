//
// move of_node_put
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r exists@
expression n,E;
identifier fld;
iterator I;
statement S;
@@

* of_node_put(n)
... when != n = E
    when != I(n,...) S
* n->fld
