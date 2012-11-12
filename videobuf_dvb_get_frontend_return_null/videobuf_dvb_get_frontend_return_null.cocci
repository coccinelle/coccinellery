//
// Test if videobuf_dvb_get_frontend return NULL
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Peter Senna Tschudin <peter.senna@gmail.com>
//

@@
identifier i,a,b;
statement S, S2;
@@
i = videobuf_dvb_get_frontend(...);
... when != if (!i) S
* if (i->a.b)
S2
