//
// eliminate double free
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
