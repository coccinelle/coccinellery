//
// Remove double test
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@expression@
expression E;
@@

* E
  || ... || E

@expression@
expression E;
@@

* E
  && ... && E
