@r expression@
identifier C;
expression E;
position p;
@@

(
 E & C@p && ...
|
 E & C@p || ...
)

@s@
identifier r.C;
position p1;
@@

#define C 0

@t@
identifier r.C;
expression E != 0;
@@

#define C E

@script:python depends on s && !t@
p << r.p;
C << r.C;
@@

cocci.print_main("and with 0", p)
