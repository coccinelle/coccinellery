//
//  Use an IS_ERR test rather than a NULL test
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julien Brunel <brunel@diku.dk>
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@match_bad_null_test@
expression x, E;
statement S1,S2;
@@
x = p9_client_walk(...)
... when != x = E
*  if (x != NULL) 
S1 else S2
