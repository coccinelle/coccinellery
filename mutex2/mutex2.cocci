@rcu exists@
position p1;
expression E;
@@

mutex_lock@p1(E);
...
mutex_unlock(E);

@exists@
position rcu.p1;
expression E;
@@

*mutex_lock@p1(E);
... when != mutex_unlock(E);
?*return ...;