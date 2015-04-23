@r@
identifier i,t,ex;
@@

struct t i = { .remove = ex, };

@@
identifier r.ex;
@@

ex(...) {
  <...
- del_timer
+ del_timer_sync
    (...)
  ...>
}


