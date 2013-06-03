//
//  Eliminate double free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
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
