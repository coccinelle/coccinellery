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
