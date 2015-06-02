@r@
expression *x;
expression f;
position p;
type T;
@@

(
memset(...)
|
f(...,(T)x@p,...,sizeof(x),...)
|
f(...,sizeof(x),...,(T)x@p,...)
)

@str@
constant C;
position r.p;
@@

C@p

@depends on !str@
expression *x;
expression f;
position r.p;
type T;
@@

*f(...,(T)x@p,...)
