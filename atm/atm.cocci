//
// Description not available
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Author name not available
//

@@
expression x, E;
constant C;
@@

x = atm_dev_lookup(...);
... when != false x != NULL
    when != true x == NULL
    when != \(E = x\|x = E\)
    when != atm_dev_put(dev);
*return -C;
