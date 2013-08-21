//
//  Drop unneeded of_node_put
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
