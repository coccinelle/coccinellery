@prelocked@
position p1,p;
expression E1;
@@

(
mutex_lock@p1
|
mutex_trylock@p1
|
spin_lock@p1
|
spin_trylock@p1
|
read_lock@p1
|
read_trylock@p1
|
write_lock@p1
|
write_trylock@p1
|
read_lock_irq@p1
|
write_lock_irq@p1
|
read_lock_irqsave@p1
|
write_lock_irqsave@p1
|
spin_lock_irq@p1
|
spin_lock_irqsave@p1
) (E1@p,...);

@looped@
position r;
@@

for(...;...;...) { <+... return@r ...; ...+> }

@err@
expression E1;
position prelocked.p;
position up != prelocked.p1;
position r!=looped.r;
identifier lock,unlock;
@@

lock(E1@p,...);
<+... when != E1
if (...) {
  ... when != E1
  return@r ...;
}
...+>
unlock@up(E1,...);

@script:python@
p << prelocked.p1;
lock << err.lock;
unlock << err.unlock;
p2 << err.r;
@@

cocci.print_main(lock,p)
cocci.print_secs(unlock,p2)
