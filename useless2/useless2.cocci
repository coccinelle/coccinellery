@r exists@
type T;
identifier i,i2;
position p;
@@

T i@p;
... 
i = i2

@@
type r.T;
identifier r.i;
constant c;
position p != r.p;
@@

-T i@p;
<... when != i
-i = c;
...>
