//
// Use UPIO_MEM rather than SERIAL_IO_MEM
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@has_sc1@
@@

#include <linux/serial_core.h>

@has_sc2@
@@

#include <linux/serial_8250.h>

@depends on has_sc1 || has_sc2@
@@

- SERIAL_IO_MEM
+ UPIO_MEM
