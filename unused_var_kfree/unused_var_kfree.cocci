@r1@
type T;
identifier i;
position p1, p2;
@@
(
T *i@p1 = NULL;
|
T *i@p1;
...
i = NULL;
)
... when != i
kfree(i)@p2;

@script:python r2@
p1 << r1.p1;
p2 << r1.p2;
@@
cocci.print_main("Declaration",p1)
cocci.print_sec("kfree()",p2)

