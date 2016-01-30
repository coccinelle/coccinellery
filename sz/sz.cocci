//
//  Correct code taking the size of a pointer
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
