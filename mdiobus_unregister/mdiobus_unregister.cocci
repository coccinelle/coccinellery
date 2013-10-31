//
//  Call mdiobus_unregister before mdiobus_free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Peter Senna Tschudin <peter.senna@gmail.com>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression E;
@@
	... when != mdiobus_unregister(E);
+ mdiobus_unregister(E);
  mdiobus_free(E);
