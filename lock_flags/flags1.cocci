//
//  Convert nested spin_lock_irqsave to spin_lock
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
expression lock1,lock2,flags;
position p1,p2;
@@

(
spin_lock_irqsave@p1(lock1,flags)
|
read_lock_irqsave@p1(lock1,flags)
|
write_lock_irqsave@p1(lock1,flags)
)
... when != flags
(
spin_lock_irqsave(lock1,flags)
|
read_lock_irqsave(lock1,flags)
|
write_lock_irqsave(lock1,flags)
|
spin_lock_irqsave@p2(lock2,flags)
|
read_lock_irqsave@p2(lock2,flags)
|
write_lock_irqsave@p2(lock2,flags)
)

@@
expression f <= r.flags;
expression lock1,lock2,flags;
position r.p1, r.p2;
@@

(
*spin_lock_irqsave@p1(lock1,flags)
|
*read_lock_irqsave@p1(lock1,flags)
|
*write_lock_irqsave@p1(lock1,flags)
)
... when != f
(
*spin_lock_irqsave@p2(lock2,flags)
|
*read_lock_irqsave@p2(lock2,flags)
|
*write_lock_irqsave@p2(lock2,flags)
)
