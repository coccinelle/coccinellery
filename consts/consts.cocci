@r@
type T;
T E;
identifier fld;
identifier c;
@@

E->fld & c

@s@
constant C;
identifier r.c;
@@

#define c C

@@
r.T E;
identifier r.fld;
identifier r.c;
constant s.C;
@@

 E->fld &
- C
+ c
