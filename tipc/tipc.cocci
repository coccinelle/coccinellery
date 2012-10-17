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