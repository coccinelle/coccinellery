//
// Use tipc_port_unlock
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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