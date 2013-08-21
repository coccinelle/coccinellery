//
//  Test if videobuf_dvb_get_frontend return NULL
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Peter Senna Tschudin <peter.senna@gmail.com>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
identifier i,a,b;
statement S, S2;
@@
i = videobuf_dvb_get_frontend(...);
... when != if (!i) S
* if (i->a.b)
S2
