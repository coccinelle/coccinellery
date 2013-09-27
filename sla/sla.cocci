//
//  Use GFP_ATOMIC when a lock is held
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
@@

spin_lock(...)
... when != spin_unlock(...)
-GFP_KERNEL
+GFP_ATOMIC