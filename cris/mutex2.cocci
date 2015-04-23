//
//  Use mutex_unlock rather than spin_unlock
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@def@
declarer DEFINE_MUTEX;
identifier m;
@@

DEFINE_MUTEX(m);

@@
identifier def.m;
@@

(
- spin_lock(&m)
+ mutex_lock(&m)
|
- spin_unlock(&m)
+ mutex_unlock(&m)
)
