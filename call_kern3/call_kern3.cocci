//
//  Use GFP_ATOMIC when a lock is held
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
