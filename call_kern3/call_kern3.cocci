@gfp exists@
identifier fn;
position p;
@@

fn(...) {
... when != spin_unlock(...)
    when any
  GFP_KERNEL@p
 ... when any
}

@locked@
identifier gfp.fn;
@@

(
spin_lock
|
spin_trylock
)
 (...)
... when != spin_unlock(...)
fn(...)

@depends on locked@
position gfp.p;
@@

- GFP_KERNEL@p
+ GFP_ATOMIC
