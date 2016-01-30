//
//  Use usb_endpoint_dir_out
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
struct usb_endpoint_descriptor *endpoint;
expression E;
@@

(
- endpoint->bEndpointAddress & USB_DIR_OUT
+ usb_endpoint_dir_out(endpoint)
|
- endpoint->bEndpointAddress == USB_DIR_OUT
+ usb_endpoint_dir_out(endpoint)
|
- (endpoint->bEndpointAddress & E) == USB_DIR_OUT
+ usb_endpoint_dir_out(endpoint)
)

@@
struct usb_endpoint_descriptor *endpoint;
expression E;
@@

(
- endpoint->bEndpointAddress & USB_DIR_IN
+ usb_endpoint_dir_in(endpoint)
|
- endpoint->bEndpointAddress == USB_DIR_IN
+ usb_endpoint_dir_in(endpoint)
|
- (endpoint->bEndpointAddress & E) == USB_DIR_IN
+ usb_endpoint_dir_in(endpoint)
)

@@
struct usb_endpoint_descriptor *endpoint;
expression E;
@@

(
- endpoint->bmAttributes & USB_ENDPOINT_XFER_ISOC
+ usb_endpoint_xfer_isoc(endpoint)
|
- endpoint->bmAttributes == USB_ENDPOINT_XFER_ISOC
+ usb_endpoint_xfer_isoc(endpoint)
|
- (endpoint->bmAttributes & E) == USB_ENDPOINT_XFER_ISOC
+ usb_endpoint_xfer_isoc(endpoint)
)

@@
struct usb_endpoint_descriptor *endpoint;
expression E;
@@

(
- endpoint->bmAttributes & USB_ENDPOINT_XFER_INT
+ usb_endpoint_xfer_int(endpoint)
|
- endpoint->bmAttributes == USB_ENDPOINT_XFER_INT
+ usb_endpoint_xfer_int(endpoint)
|
- (endpoint->bmAttributes & E) == USB_ENDPOINT_XFER_INT
+ usb_endpoint_xfer_int(endpoint)
)