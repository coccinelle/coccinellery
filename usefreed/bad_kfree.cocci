//
//  Correct use after free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// use argument -D fn=xxx for the name of the freeing function of interest

@print@
constant char *c;
expression E1,E2;
type T;
position p;
identifier f;
@@

(
 f(...,c,...,(T)E1@p,...)
|
 E1@p == E2
|
 E1@p != E2
)

@sz@
expression E1;
position p;
@@

 sizeof(<+...E1@p...+>)

@free@
identifier virtual.fn;
expression E;
position p1;
@@

fn@p1(E,...)

@r exists@
expression free.E, subE<=free.E, E2;
expression E1;
iterator iter;
statement S;
position free.p1,p2!={print.p,sz.p};
identifier virtual.fn;
@@

fn@p1(E,...)
...
(
 iter(subE,...) S // no use
|
 list_remove_head(E1,subE,...)
|
 subE = E2
|
 subE++
|
 ++subE
|
 --subE
|
 subE--
|
 &subE
|
 E@p2 // bad use
)

@script:python@
p1 << free.p1;
p2 << r.p2;
@@

cocci.print_main("kfree",p1)
cocci.print_secs("ref",p2)
