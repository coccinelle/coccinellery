//
//  Eliminate double free
//
// Target:  Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@kfree@
type T;
identifier f,x;
@@

f(T x) { kfree(x); }

@voidfn@
identifier kfree.f,x;
@@

f(void *x) { kfree(x); }

@ script:python depends on !voidfn @
f << kfree.f; // identifier
t << kfree.T; // identifier
@@

print "kfree: FN:%s TY:%s" % (f,t)
