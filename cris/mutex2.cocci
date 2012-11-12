//
// Use mutex_unlock rather than spin_unlock
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
