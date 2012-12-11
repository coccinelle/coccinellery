//
//  use BLOCK_NIL
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
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
