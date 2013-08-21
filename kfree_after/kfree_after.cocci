@r@
identifier x;
@@

kfree(x)

@@
identifier r.x;
expression E1!=0,E2,E3,E4;
statement S;
@@

(
if (<+...x...+>) S
|
if (...) { ... when != kfree(x)
               when != if (...) { ... kfree(x); ... }
               when != x = E3
+ kfree(x);
  return E1; }
... when != x = E2
if (...) { ... when != x = E4
 kfree(x); ... return ...; }
)
