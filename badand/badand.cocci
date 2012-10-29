//
// Convert && to ||
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@disable and_comm@
expression E;
identifier fld;
@@

- !E && !E->fld
+ !E || !E->fld

@disable or_comm@
expression E;
identifier fld;
@@

- E || E->fld
+ E && E->fld
