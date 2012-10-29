@a forall@
idexpression *x;
identifier f != ERR_PTR;
position p1,p2;
@@

x@p1 = f(...)
... when != x
(
x = f(...,<+...x...+>,...)
|
x@p2 = f(...)
)

@script:python@
p1 << a.p1;
p2 << a.p2;
@@

if (p1[0].line == p2[0].line):
  cocci.include_match(False)

@@
idexpression *x;
identifier f;
position a.p1,a.p2;
@@

*x@p1 = f(...)
...
*x@p2 = f(...)
