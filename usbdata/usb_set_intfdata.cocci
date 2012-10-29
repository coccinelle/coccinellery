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

