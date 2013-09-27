//
//  failure test for null rather than negative integer
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression x,e;
statement S1,S2;
@@

*x = dev_get_platdata(...)
... when != x = e
*if (x < 0) S1 else S2