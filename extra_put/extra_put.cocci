//
// Drop unneeded of_node_put
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
iterator for_each_pci_dev;
expression d;
@@

  for_each_pci_dev(d) {
    ... when != break;
  }
  ... when != d
?- pci_dev_put(d);

@@
iterator for_each_node_by_name;
expression d;
@@

  for_each_node_by_name(d,...) {
    ... when != break;
  }
  ... when != d
?- of_node_put(d);

@@
iterator for_each_node_by_type;
expression d;
@@

  for_each_node_by_type(d,...) {
    ... when != break;
  }
  ... when != d
?- of_node_put(d);

@@
iterator for_each_compatible_node;
expression d;
@@

  for_each_compatible_node(d,...) {
    ... when != break;
  }
  ... when != d
?- of_node_put(d);

@@
iterator shost_for_each_device;
expression d;
@@

  shost_for_each_device(d,...) {
    ... when != break;
  }
  ... when != d
?- scsi_device_put(d);
