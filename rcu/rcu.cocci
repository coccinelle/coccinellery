//
//  Call rcu_read_unlock in default case
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@rcu@
position p1;
@@

rcu_read_lock@p1();
...
rcu_read_unlock();

@@
position rcu.p1;
@@

*rcu_read_lock@p1();
... when != rcu_read_unlock();
