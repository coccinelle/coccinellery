@@
expression E;
@@
	... when != mdiobus_unregister(E);
+ mdiobus_unregister(E);
  mdiobus_free(E);
