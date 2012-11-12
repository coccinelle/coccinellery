@@
declarer name DEFINE_SPINLOCK;
identifier xxx_lock;
@@

- spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
+ DEFINE_SPINLOCK(xxx_lock);

@@
expression E;
@@

- E = SPIN_LOCK_UNLOCKED
+ spin_lock_init(&E)
