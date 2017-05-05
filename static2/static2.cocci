@bad exists@
position p;
identifier x;
type T;
@@

static T x@p;
...
x = <+...x...+>

@@
identifier x;
expression e;
type T;
position p != bad.p;
@@

-static
 T x@p;
 ... when != x
     when strict
?x = e;