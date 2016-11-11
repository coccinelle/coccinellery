@@
expression t,e;
@@

t = \(xt_find_table_lock(...)\|
      try_then_request_module(xt_find_table_lock(...),...)\)
... when != t=e
- ! IS_ERR_OR_NULL(t)
+ t

@@
expression t,e;
@@

t = \(xt_find_table_lock(...)\|
      try_then_request_module(xt_find_table_lock(...),...)\)
... when != t=e
- IS_ERR_OR_NULL(t)
+ !t

@@
expression t,e,e1;
@@

t = \(xt_find_table_lock(...)\|
      try_then_request_module(xt_find_table_lock(...),...)\)
... when != t=e
?- t ? PTR_ERR(t) : e1
+ e1
... when any

