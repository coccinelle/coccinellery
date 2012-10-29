//
// use the constant InterlaceMode
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
