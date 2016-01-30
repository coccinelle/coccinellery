@ok1@
identifier i1,i2;
position p;
@@

struct i1 i2@p = { \(0\|NULL\) };

@ok2@
identifier i1,i2,i3;
position p;
expression e;
@@

struct i1 i2@p = { ..., .i3 = e, ... };

@ok3@
identifier i1,i2;
position p;
@@

struct i1 i2@p = { ..., { ... }, ... };

@decl@
identifier i1,fld;
type T;
field list[n] fs;
@@

struct i1 {
 fs
 T fld;
 ...};

@bad@
identifier decl.i1,i2;
expression e;
position p != {ok1.p,ok2.p,ok3.p};
constant nm;
initializer list[decl.n] is;
position fix;
@@

struct i1 i2@p = { is,
(
 nm(...)
|
 e@fix
)
 ,...};

@@
identifier decl.i1,i2,decl.fld;
expression e;
position bad.p, bad.fix;
@@

struct i1 i2@p = { ...,
+ .fld = e
- e@fix
 ,...};
