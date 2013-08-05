@locked@
position p,p1;
expression E1;
@@

(
read_lock_irq
|
write_lock_irq
|
read_lock_irqsave
|
write_lock_irqsave
|
local_irq_save@p1
|
spin_lock_irq@p1
|
spin_lock_irqsave@p1
) (E1@p,...);

@r exists@
expression E1;
identifier lock;
position locked.p,p1,p2;
identifier f;
@@

f (...) { <+...
lock@p1 (E1@p,...);
... when != E1
(
return@p2 ...;
|
return ...; // end of function with no actual return
)
...+> }

@inverted exists@
identifier r.f;
position p != locked.p;
expression r.E1;
@@

f(...) {
  ... when != E1
  E1@p
  ... when any
}

@bad depends on !inverted exists@
position p2 != locked.p;
position r.p1;
identifier lock;
expression E1;
@@

lock@p1(E1,...)
...
E1@p2

@balanced depends on bad exists@
position locked.p, p1 != locked.p1;
identifier lock,unlock,r.f;
expression E,E1;
@@

f (...) { <+...
if (E) {
 <+... when != E1
 lock(E1@p,...)
 ...+>
}
... when != E1
    when forall
if (E) {
 <+... when != E1
 unlock@p1(E1,...)
 ...+>
}
...+> }

@script:python depends on bad && !balanced@
p << locked.p;
p2 << r.p2;
@@

cocci.print_main("lock",p)
cocci.print_secs("return",p2)
cocci.include_match(False)

@script:python depends on bad && !balanced@
p << locked.p;
@@

cocci.print_main("lock",p)

