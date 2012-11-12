//
// Use an IS_ERR test rather than a NULL test
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julien Brunel <brunel@diku.dk>
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@match_bad_null_test@
expression x, E;
statement S1,S2;
@@
x = p9_client_walk(...)
... when != x = E
*  if (x != NULL) 
S1 else S2
