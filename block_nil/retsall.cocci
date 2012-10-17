//
// use BLOCK_NIL
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r exists@
identifier f;
identifier C;
@@

f(...) { ... return C; }

@s@
identifier r.C;
expression E;
@@

#define C E

@@
identifier r.f;
identifier r.C;
expression s.E;
identifier I;
@@

f(...) {
 <...
(
  I
|
- E
+ C
)
 ...>
}
