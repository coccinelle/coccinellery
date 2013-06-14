//
//  Call mutex_unlock in error handling code
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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