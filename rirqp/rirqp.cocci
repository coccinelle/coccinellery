@r exists@
expression e,e1,e2,e3,e4,e5;
type T;
position p1,p2;
@@

request_irq@p1(e1,e2,e3,e4,e5)
...
(
 free_irq(e1,(T)e5);
|
free_irq@p2(e1,e);
)

@bad1 exists@
position r.p1,r.p2;
expression e1,e2,e3,e4,e5;
@@

request_irq@p1(e1,e2,e3,e4,(void *)e5)
...
free_irq@p2(e1,e5);

@bad2 exists@
position r.p1,r.p2;
statement S;
@@

if (request_irq@p1(...)) S else { <+... free_irq@p2(...); ...+> }

@script:python depends on !bad1 && !bad2@
p1 << r.p1;
p2 << r.p2;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)