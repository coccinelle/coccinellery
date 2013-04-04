//
//  Eliminate a NULL pointer dereference
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// use argument -all_includes: too slow

@ifm@
expression *E;
statement S1,S2;
position p1;
@@

if@p1 ((E == NULL && ...) || ...) S1 else S2

// the following two rules are separate, because both can match a single
// expression in different ways
@pr1 expression@
expression *ifm.E;
identifier f;
position p1;
@@

 (E != NULL && ...) ? <+...E->f@p1...+> : ...

@pr2 expression@
expression *ifm.E;
identifier f;
position p2;
@@

(
  (E != NULL) && ... && <+...E->f@p2...+>
|
  (E == NULL) || ... || <+...E->f@p2...+>
|
 sizeof(<+...E->f@p2...+>)
)

@r exists@
expression subE <= ifm.E;
expression *ifm.E;
expression E1,E2;
identifier f;
statement S1,S2,S3,S4;
iterator iter;
position p!={pr1.p1,pr2.p2},g;
position ifm.p1;
identifier l;
@@

if@p1 ((E == NULL && ...) || ...)
{
 ... when != if ((E == NULL && ...) || ...) S1 else S2
        when != iter(subE,...) S4 // no use
        when != list_remove_head(E2,subE,...)
        when != subE = E1
        when != subE++
        when != ++subE
        when != --subE
        when != subE--
        when != &subE
 E->f@p // bad use
 ... when any
}
else S3

@script:python@
p << r.p;
p1 << ifm.p1;
@@

cocci.print_main("nullref",p)


//@rr exists@
//expression subE <= ifm.E;
//expression *ifm.E;
//expression E1,E2;
//identifier f;
//statement S1,S2,S4;
//iterator iter;
//position p!={pr1.p1,pr2.p2},r.g;
//identifier l;
//@@
//
//goto l@g;
//  <...E->f@p...> // bad use
//(
// if ((E == NULL && ...) || ...) S1 else S2
//|
// list_remove_head(E2,subE,...)
//|
// subE = E1
//|
// subE++
//|
// ++subE
//|
// --subE
//|
// subE--
//|
// &subE
//|
//? iter(subE,...) S4 // no use
//)
//
//@script:python@
//p << rr.p;
//@@
//
//for q in p:
// x = [q]
// cocci.print_main("nullref",x)
