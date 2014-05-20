//
//  Eliminate update of list_for_each_entry loop cursor
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
iterator name list_for_each_entry;
expression x,E;
position p1,p2;
@@

list_for_each_entry@p1(x,...) { <... x =@p2 E ...> }

@@
expression x,E;
position r.p1,r.p2;
statement S;
@@

*x =@p2 E
...
list_for_each_entry@p1(x,...) S
