//
//  Use usb_mark_last_busy
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

usb_mark_last_busy@p(...) { ... }

@depends on header@
position _p!=same.p;
identifier _f;
struct usb_device*udev;
@@

_f@_p(...) { <+...

- udev

+ usb_mark_last_busy
+ (
+ udev
+ )
+ ;

- ->
- last_busy 
- = 
- jiffies
- ;
...+> }

