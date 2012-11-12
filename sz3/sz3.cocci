@@
expression *e;
type T;
identifier f;
@@

f(...,
-sizeof(e)
+sizeof(*e)
,...,(T)e,...)

@@
expression *e;
type T;
identifier f;
@@

f(...,(T)e,...,
-sizeof(e)
+sizeof(*e)
,...)
