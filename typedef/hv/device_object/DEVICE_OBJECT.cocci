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
