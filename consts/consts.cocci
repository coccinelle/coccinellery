//
//  use the constant InterlaceMode
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
