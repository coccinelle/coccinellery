//
// Description not available
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Author name not available
//

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

