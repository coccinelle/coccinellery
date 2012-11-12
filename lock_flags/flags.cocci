// Copyright: (C) 2009 Gilles Muller, Julia Lawall, INRIA, DIKU.  GPLv2.

@@
expression lock1,lock2;
expression flags;
@@

*spin_lock_irqsave(lock1,flags)
... when != flags
*spin_lock_irqsave(lock2,flags)
