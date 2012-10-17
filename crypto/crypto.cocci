//
// add NULL test around call to crypto_free_hash
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
