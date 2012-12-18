//
//  Remove double test
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
