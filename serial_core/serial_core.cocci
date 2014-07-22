//
//  Use UPIO_MEM rather than SERIAL_IO_MEM
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
