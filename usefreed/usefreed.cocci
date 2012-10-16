@r@
expression x,e;
identifier f;
iterator I;
statement S;
position p1,p2;
@@

kfree@p1(x);
... when != &x
    when != x = e
    when != I(x,...) S
x@p2->f

@bad@
position r.p1,r.p2;
expression x,e;
identifier i;
iterator I;
statement S;
@@

kfree@p1(<+...i...+>);
... when != x@p2->f
(
I(i,...) S
|
&i
|
i=e
)

@depends on !bad@
expression x;
identifier f;
position r.p1,r.p2;
@@

*kfree@p1(x);
...
*x@p2->f
