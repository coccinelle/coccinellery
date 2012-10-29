@header@
@@

#include <linux/usb.h>

@same depends on header@
position p;
@@

usb_get_intfdata@p(...) { ... }

@depends on header@
position _p!=same.p;
identifier _f;
struct usb_interface*intf;
@@

_f@_p(...) { <+...
- dev_get_drvdata(&intf->dev)
+ usb_get_intfdata(intf)
...+> }

