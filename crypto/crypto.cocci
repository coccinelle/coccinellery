//
//  Add NULL test around call to crypto_free_hash
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@safe@
position p;
expression x;
@@

if (x) { <+... crypto_free_hash@p(x) ...+> }

@@
expression x;
position p!=safe.p;
@@

*x = NULL
...
*crypto_free_hash@p(x)

@@
expression x;
position p!=safe.p;
@@

if (x == NULL || ...) { ...
*crypto_free_hash@p(x)
...
return ...;
}

@@
expression x;
position p!=safe.p;
@@

if (IS_ERR(x) || ...) { ...
*crypto_free_hash@p(x)
...
return ...;
}
