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
