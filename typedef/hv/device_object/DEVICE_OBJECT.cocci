//
// Staging: hv: Transform PDEVICE_OBJECT and DEVICE_OBJECT typedefs into their corresponding structs
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Nicolas Palix <npalix@diku.dk>
//

@rm_PDEVICE_OBJECT@
@@
-typedef struct _DEVICE_OBJECT *PDEVICE_OBJECT;

@rm_DEVICE_OBJECT@
@@
-typedef struct _DEVICE_OBJECT
+struct hv_device
{...}
-DEVICE_OBJECT
;

@fixtypedef_PDEVICE_OBJECT@
typedef PDEVICE_OBJECT;
@@
-PDEVICE_OBJECT
+struct hv_device*

@fixtypedef_DEVICE_OBJECT@
typedef DEVICE_OBJECT;
@@
-DEVICE_OBJECT
+struct hv_device

@fixstruct__DEVICE_OBJECT@
@@
struct
-_DEVICE_OBJECT
+hv_device
