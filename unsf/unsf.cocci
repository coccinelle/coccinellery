//
//  Fix return value from an unsigned function
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
identifier f;
constant C;
@@

static unsigned f(...) { <+...
  return -C;
...+> }

@ok1@
int x;
identifier r.f;
position p;
@@

x = f@p(...)

@ok2 expression@
int x;
identifier r.f;
position p;
@@

(
 f@p(...) || ...
|
 !f@p(...)
)

@ok3@
int x;
identifier r.f;
position p;
@@

f@p(...);

@other@
identifier r.f;
position p1 != {ok1.p,ok2.p,ok3.p};
@@

f@p1

@depends on !other@
identifier r.f;
@@

-unsigned
 int f
  (...) { ... }

@depends on !other@
identifier r.f;
@@

-unsigned
+int
 f
  (...) { ... }
