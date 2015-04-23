//
//  Add missing fput
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
local idexpression x;
statement S;
position p1,p2,p3;
identifier f;
expression E;
identifier l;
expression *ptr != NULL;
@@

(
 if@p1 ((x = fget(...)) == NULL) S
|
 x@p1 = fget(...);
 ... when != x
 if (x == NULL) S
)
 <... when != x
      when != if (...) { <+...x...+> }
(
  goto@p3 l;
|
  x->f = E
)
 ...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@ script:python @
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@

print "* file: %s call: %s return: %s via: %s" % (p1[0].file,p1[0].line,p2[0].line,p3[0].line)
cocci.include_match(False)


@ script:python @
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s call: %s return: %s" % (p1[0].file,p1[0].line,p2[0].line)
