//
//  use BLOCK_NIL
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
