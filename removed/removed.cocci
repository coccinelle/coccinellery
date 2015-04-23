@@
identifier x;
type T;
@@

{
... when any
-T x[...];
<+... when != x
- memset(x,...);
...+>
}

@@
identifier x,i;
type T;
@@

{
... when any
-struct i x;
<+... when != x
- memset(&x,...);
...+>
}
