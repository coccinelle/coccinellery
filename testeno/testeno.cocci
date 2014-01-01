// Target: Linux

@@
expression *x;
identifier f;
statement S1,S2;
@@

*x = f(...);
 if (x) { <+... when != if (...) S1 else S2
     -ENOMEM ...+> }