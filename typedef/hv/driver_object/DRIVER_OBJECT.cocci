//
// Staging: hv: Remove typedef DRIVER_OBJECT and PDRIVER_OBJECT
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Nicolas Palix <npalix@diku.dk>
//

@rm_DRIVER_OBJECT@
@@
-typedef struct _DRIVER_OBJECT
+struct hv_driver
{...}
-DRIVER_OBJECT
;

@rm_PDRIVER_OBJECT@
@@
-typedef struct _DRIVER_OBJECT *PDRIVER_OBJECT;
+struct hv_driver;

@fixtypedef_DRIVER_OBJECT@
typedef DRIVER_OBJECT;
@@
-DRIVER_OBJECT
+struct hv_driver

@fixstruct__DRIVER_OBJECT@
@@
struct
-_DRIVER_OBJECT
+hv_driver

@fixtypedef_PDRIVER_OBJECT@
typedef PDRIVER_OBJECT;
@@
-PDRIVER_OBJECT
+struct hv_driver*

