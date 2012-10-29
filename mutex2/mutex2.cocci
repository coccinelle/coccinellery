//
// Description not available
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Author name not available
//

@rcu exists@
position p1;
expression E;
@@

mutex_lock@p1(E);
...
mutex_unlock(E);

@exists@
position rcu.p1;
expression E;
@@

*mutex_lock@p1(E);
... when != mutex_unlock(E);
?*return ...;