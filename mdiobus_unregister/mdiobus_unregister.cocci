//
// Call mdiobus_unregister before mdiobus_free
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Peter Senna Tschudin <peter.senna@gmail.com>
//

@@
expression E;
@@
	... when != mdiobus_unregister(E);
+	mdiobus_unregister(E);
	mdiobus_free(E);
