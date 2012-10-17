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
