//
//  Delete unnecessary call to usb_kill_urb
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
expression urb;
statement S;
position p1,p2;
@@

urb = usb_alloc_urb@p1(...);
... when != urb
if (urb == NULL) S
... when != urb
usb_kill_urb@p2(urb);

@other exists@
position r.p1,r.p2;
@@

... when != usb_alloc_urb@p1(...)
usb_kill_urb@p2(...);

@depends on !other exists@
expression urb;
position r.p1,r.p2;
@@

urb = usb_alloc_urb@p1(...);
...
(
-usb_kill_urb@p2(urb);
+usb_free_urb(urb);
... when != urb
|
-usb_kill_urb@p2(urb);
)