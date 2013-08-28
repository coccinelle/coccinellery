//
//  Use tipc_port_unlock
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
struct port *p_ptr;
@@

   p_ptr = tipc_port_lock(...)
   ...
(
   p_ptr = tipc_port_lock(...);
|
?- spin_unlock_bh(p_ptr->publ.lock);
+  tipc_port_unlock(p_ptr);
)