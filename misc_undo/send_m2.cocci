//
//  Add missing snd_card_free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// no free

@r exists@
local idexpression x;
statement S,S1;
position p1,p2,p3;
expression E,E1;
type T,T1;
expression *ptr != NULL;
@@

(
 if ((x@p1 = snd_card_new(...)) == NULL) S
|
 x@p1 = snd_card_new(...);
)
 ... when != snd_card_free(...,(T)x,...)
     when != if (...) { <+... snd_card_free(...,(T)x,...) ...+> }
     when != true x == NULL || ...
     when != x = E
     when != E = (T)x
     when any
(
 if (x == NULL || ...) S1
|
 if@p2 (...) {
  ... when != snd_card_free(...,(T1)x,...)
      when != if (...) { <+... snd_card_free(...,(T1)x,...) ...+> }
      when != x = E1
      when != E1 = (T1)x
(
  return \(0\|<+...x...+>\|ptr\);
|
  return@p3 ...;
)
}
)

@ script:python @
p1 << r.p1;
p3 << r.p3;
@@

print "* file: %s snd_card_new: %s return: %s" % (p1[0].file,p1[0].line,p3[0].line)
