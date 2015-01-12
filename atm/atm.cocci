@@
expression x, E;
constant C;
@@

x = atm_dev_lookup(...);
... when != false x != NULL
    when != true x == NULL
    when != \(E = x\|x = E\)
    when != atm_dev_put(dev);
*return -C;
