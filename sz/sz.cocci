//
// Correct code taking the size of a pointer
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
