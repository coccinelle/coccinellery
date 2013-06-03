// use argument -D fn=xxx for the name of the freeing function of interest

@free@
identifier virtual.fn;
expression E;
position p1;
@@

fn@p1(E,...)

@stat@
identifier virtual.fn;
type T;
@@

static T fn(...) {...}

@script:python depends on stat@
p1 << free.p1;
E << free.E;
defining_file << virtual.defining_file;
@@

defining_file = "%s" % defining_file # convert a cocci string to a python one
if (not(p1[0].file == defining_file)):
 cocci.include_match(False)

@print expression@
constant char *c;
expression free.E,E2;
type T;
position p;
identifier f;
@@

(
 f(...,c,...,(T)E@p,...)
|
 E@p == E2
|
 E@p != E2
|
 !E@p
|
 E@p || ...
)

@sz@
expression free.E;
position p;
@@

 sizeof(<+...E@p...+>)

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
 iter(...,subE,...) S // no use
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
fn << virtual.fn;
p1 << free.p1;
p2 << r.p2;
@@

cocci.print_main(fn,p1)
cocci.print_secs("ref",p2)
