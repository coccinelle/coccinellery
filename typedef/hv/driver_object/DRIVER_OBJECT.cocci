//
//  Remove typedef DRIVER_OBJECT and PDRIVER_OBJECT
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Nicolas Palix <npalix@diku.dk>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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

