//
// Use negated usb_endpoint_xfer_control, etc
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_CONTROL\|0\))
+ !usb_endpoint_xfer_control(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_ISOC\|1\))
+ !usb_endpoint_xfer_isoc(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_BULK\|2\))
+ !usb_endpoint_xfer_bulk(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_INT\|3\))
+ !usb_endpoint_xfer_int(epd)
