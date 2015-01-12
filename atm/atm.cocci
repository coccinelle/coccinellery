//
//  add missing atm_dev_put
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
