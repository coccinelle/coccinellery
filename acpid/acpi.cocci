//
//  Drop uses of acpi_driver_data
//
// Target:  Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <julia.lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
struct acpi_device *d;
@@

- acpi_driver_data(d)
+ d->driver_data

