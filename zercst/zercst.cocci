//
// adjust suspicious bit operation
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@and@
identifier i;
expression e;
position p;
@@

 ((e & i@p) && ...)

@iszera@
identifier and.i;
position p;
@@

#define i 0

@othera@
identifier and.i;
expression e!=0;
@@

#define i e

@script:python depends on iszera && !othera@
p << and.p;
@@

cocci.print_main("",p)

@or@
identifier i;
expression e;
position p;
@@

 ((e | i@p) && ...)


@iszero@
identifier or.i;
position p;
@@

#define i 0

@othero@
identifier or.i;
expression e!=0;
@@

#define i e

@script:python depends on (othero && !iszero) || (iszero && !othero)@
p << or.p;
@@

cocci.print_main("",p)
