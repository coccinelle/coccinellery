@r@
identifier f;
@@

f(...) { <+... return NULL; ...+> }

@@
expression *x;
expression y;
identifier r.f;
statement S;
@@

x = f(...);
(
if ((x) == NULL) S
|
if (
-   y
+   x
       == NULL)
 S
)
