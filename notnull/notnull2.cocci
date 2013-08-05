// Copyright: (C) 2009 Gilles Muller, Julia Lawall, INRIA, DIKU.  GPLv2.

@r exists@
local idexpression x;
expression E;
position p1,p2;
@@

if (x@p1 == NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\)
    when != &x
    when any
(
x@p2 == NULL
|
x@p2 != NULL
)

// another path to the test that is not through p1?

@s exists@
local idexpression r.x;
position r.p1,r.p2;
@@

... when != x@p1
(
x@p2 == NULL
|
x@p2 != NULL
)

// another path to the test from p1?

@t exists@
local idexpression x;
position r.p1,r.p2;
@@

if (x@p1 == NULL || ...) { ... x@p2 ... when any
   return ...; }

// another path to the test containing an assignment?

@u exists@
local idexpression x;
expression E;
position r.p1,r.p2;
@@

if (x@p1 == NULL || ...) { ... when forall
   return ...; }
 ...
 \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
 ...  when != x@p1
      when any
(
x@p2 == NULL
|
x@p2 != NULL
)

@depends on !s && !t && !u expression@
position r.p2;
expression x;
@@

(
* x@p2 != NULL || ...
|
* x@p2 == NULL
)