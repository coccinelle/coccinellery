@@
expression e,e1,e2,e3;
identifier f,free1,free2;
expression a;
@@

*e->f = a
... when != e->f = e1
    when any
if (...) {
  ... when != free1(...,e,...)
      when != e->f = e2
* kfree(a)
  ... when != free2(...,e,...)
      when != e->f = e3
}