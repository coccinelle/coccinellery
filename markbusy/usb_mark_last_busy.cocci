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

