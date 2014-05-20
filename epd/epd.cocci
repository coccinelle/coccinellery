//
//  Use USB API functions rather than constants
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\)) ==
- \(USB_ENDPOINT_XFER_CONTROL\|0\))
+ usb_endpoint_xfer_control(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\)) ==
- \(USB_ENDPOINT_XFER_ISOC\|1\))
+ usb_endpoint_xfer_isoc(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\)) ==
- \(USB_ENDPOINT_XFER_BULK\|2\))
+ usb_endpoint_xfer_bulk(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\)) ==
- \(USB_ENDPOINT_XFER_INT\|3\))
+ usb_endpoint_xfer_int(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\)) ==
-  \(USB_DIR_IN\|0x80\))
+ usb_endpoint_dir_in(epd)

// Since USB_ENDPOINT_DIR_MASK selects only one bit and USB_DIR_IN is nonzero,
// anding with USB_DIR_IN in a test expression has the same effect as the above
@expression@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_DIR_IN\|0x80\))
+ usb_endpoint_dir_in(epd)
  || ...

// The same comment applies here
@expression@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_DIR_IN\|0x80\))
+ usb_endpoint_dir_in(epd)
  && ...

@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\)) ==
-  \(USB_DIR_OUT\|0\))
+ usb_endpoint_dir_out(epd)

// Not IN must be OUT, since USB_ENDPOINT_DIR_MASK extracts a single bit
@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\)) !=
-  \(USB_DIR_IN\|0x80\))
+ usb_endpoint_dir_out(epd)

// Not OUT must be IN, since USB_ENDPOINT_DIR_MASK extracts a single bit
@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\)) !=
-  \(USB_DIR_OUT\|0\))
+ usb_endpoint_dir_in(epd)

@expression@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\))
+ usb_endpoint_dir_in(epd)
  && ...

@expression@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\))
+ usb_endpoint_dir_in(epd)
  || ...

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
+ usb_endpoint_num(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\))
+ usb_endpoint_type(epd)

@@ struct usb_endpoint_descriptor *epd; @@

usb_endpoint_type(epd) !=
- 0
+ USB_ENDPOINT_XFER_CONTROL

@@ struct usb_endpoint_descriptor *epd; @@

usb_endpoint_type(epd) !=
- 1
+ USB_ENDPOINT_XFER_ISOC

@@ struct usb_endpoint_descriptor *epd; @@

usb_endpoint_type(epd) !=
- 2
+ USB_ENDPOINT_XFER_BULK

@@ struct usb_endpoint_descriptor *epd; @@

usb_endpoint_type(epd) !=
- 3
+ USB_ENDPOINT_XFER_INT

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_xfer_bulk(epd) && usb_endpoint_dir_in(epd))
+ usb_endpoint_is_bulk_in(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_xfer_bulk(epd) && usb_endpoint_dir_out(epd))
+ usb_endpoint_is_bulk_out(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_xfer_int(epd) && usb_endpoint_dir_in(epd))
+ usb_endpoint_is_int_in(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_xfer_int(epd) && usb_endpoint_dir_out(epd))
+ usb_endpoint_is_int_out(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_xfer_isoc(epd) && usb_endpoint_dir_in(epd))
+ usb_endpoint_is_isoc_in(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (usb_endpoint_xfer_isoc(epd) && usb_endpoint_dir_out(epd))
+ usb_endpoint_is_isoc_out(epd)
