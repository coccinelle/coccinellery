//
//  Change simple_strtol to simple_strtoul
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r1@
int e;
position p;
@@

e = simple_strtol@p(...)

@r2@
long e;
position p;
@@

e = simple_strtol@p(...)

@r3@
s32 e;
position p;
@@

e = simple_strtol@p(...)

@@
position p != {r1.p,r2.p,r3.p};
type T;
T e;
@@

e = 
- simple_strtol@p
+ simple_strtoul
  (...)

@s1@
int e;
position p;
@@

strict_strtol@p(...,&e)

@s2@
long e;
position p;
@@

strict_strtol@p(...,&e)

@s3@
s32 e;
position p;
@@

strict_strtol@p(...,&e)

@@
position p != {s1.p,s2.p,s3.p};
type T;
T e;
@@

- strict_strtol@p
+ strict_strtoul
  (...,&e)
