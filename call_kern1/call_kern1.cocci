@gfp exists@
identifier fn;
position p;
@@

fn(...) {
 ... when != read_unlock_irq
     when != write_unlock_irq
     when != read_unlock_irqrestore
     when != write_unlock_irqrestore
     when != spin_unlock_irq
     when != spin_unlock_irqrestore
     when != local_irq_enable
     when any
 GFP_KERNEL@p
 ... when any
}

@locked@
identifier gfp.fn;
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
spin_lock_irq
|
spin_lock_irqsave
|
local_irq_disable
)
 (...)
...  when != read_unlock_irq
     when != write_unlock_irq
     when != read_unlock_irqrestore
     when != write_unlock_irqrestore
     when != spin_unlock_irq
     when != spin_unlock_irqrestore
     when != local_irq_enable
fn(...)

@depends on locked@
position gfp.p;
@@

- GFP_KERNEL@p
+ GFP_ATOMIC
