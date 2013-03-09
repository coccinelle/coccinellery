//
//  Use usb_set/get_intfdata
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@header@
@@

#include <linux/usb.h>

@same depends on header@
position p;
@@

usb_set_intfdata@p(...) { ... }

@depends on header@
position _p!=same.p;
identifier _f;
struct usb_interface *intf;
expression data;
@@

_f@_p(...) { <+...
- dev_set_drvdata(&intf->dev, data);
+ usb_set_intfdata(intf, data);
...+> }

