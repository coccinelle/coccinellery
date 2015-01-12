@@
identifier x;
local idexpression e;
type T,T1;
@@

{
... when any
T x[...];
... when any
    when exists
(
e = (T1)x
|
e = (T1)&x[0]
)
... when any
    when exists
- memset
+ memzero_explicit
  (x,
-0,
  ...)
... when != x
    when != e
    when strict
}

@@
identifier i,x;
local idexpression e;
type T;
@@

{
... when any
struct i x;
... when any
    when exists
e = (T)&x
... when any
    when exists
- memset
+ memzero_explicit
  (&x,
-0,
  ...)
... when != x
    when != e
    when strict
}

// ------------------------------------------------------------------------

@@
identifier x;
type T,T1;
expression e;
@@

{
... when any
T x[...];
... when any
    when exists
    when != e = (T1)x
    when != e = (T1)&x[0]
- memset
+ memzero_explicit
  (x,
-0,
  ...)
... when != x
    when strict
}

@@
identifier i,x;
expression e;
type T;
@@

{
... when any
struct i x;
... when any
    when exists
    when != e = (T)&x
- memset
+ memzero_explicit
  (&x,
-0,
  ...)
... when != x
    when strict
}