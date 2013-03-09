//
//  Remove unnecessary error check
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@badif@
position p;
identifier l;
@@

if@p (...) { ... goto l; ...}

@printreturn@
position p;
constant char *C;
identifier print;
@@

print(...,C,...);
return@p ...;

@r@
statement S1,S2,S3;
constant C1,C2,C3;
position p1 != badif.p;
position p2 != badif.p;
position p3 != badif.p;
position p4 != printreturn.p;
@@

if@p1 (...)
 {... S1 return@p4 -C1;}
...
if@p2 (...)
 {... when != S1
    return -C2;}
...
if@p3 (...)
 {... S1 return -C3;}

@script:python@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@
p1 = int(p1[0].line)
p2 = int(p2[0].line)
p3 = int(p3[0].line)
if (p1 >= p2):
  cocci.include_match(False)
if (p1 >= p3):
  cocci.include_match(False)
if (p2 >= p3):
  cocci.include_match(False)

@@
position r.p1, r.p2, r.p3;
statement S;
@@

(
*if@p1 (...)
 S
|
*if@p2 (...)
 S
|
*if@p3 (...)
 S
)
