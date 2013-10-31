@@
local idexpression x;
expression e;
@@

*x = pci_get_slot(...)
... when != true x == NULL
    when != pci_dev_put(x)
    when != e = x
    when != if (x != NULL) {<+... pci_dev_put(x); ...+>}
*return ...;
