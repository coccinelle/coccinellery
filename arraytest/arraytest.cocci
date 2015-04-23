//
//  delete unnecessary null test on array
//
// Target: Linux
// Copyright:  Copyright: 2014 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
type T;
T [] e;
position p;
@@

(
 e ==@p NULL
|
 e !=@p NULL
|
 !@p e
)

@ disable fld_to_ptr@
expression e;
identifier f;
position r.p;
@@

(
* (e.f) ==@p NULL
|
* (e.f) !=@p NULL
|
* !@p(e.f)
)
