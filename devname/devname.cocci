//
//  Eliminate NULL dereference
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression dev,E;
@@

*dev_name(dev)
... when != dev = E
(
*dev == NULL
|
*dev != NULL
)