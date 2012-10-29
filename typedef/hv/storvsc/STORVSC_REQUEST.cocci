//
// Staging: hv: Remove typedef STORVSC_REQUEST and PSTORVSC_REQUEST
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Nicolas Palix <npalix@diku.dk>
//

@rm_STORVSC_REQUEST@
@@
-typedef struct _STORVSC_REQUEST
+struct hv_storvsc_request
{...}
-STORVSC_REQUEST
;

@rm_PSTORVSC_REQUEST@
@@
-typedef struct _STORVSC_REQUEST *PSTORVSC_REQUEST;
+struct hv_storvsc_request;

@fixtypedef_STORVSC_REQUEST@
typedef STORVSC_REQUEST;
@@
-STORVSC_REQUEST
+struct hv_storvsc_request

@fixstruct__STORVSC_REQUEST@
@@
struct
-_STORVSC_REQUEST
+hv_storvsc_request

@fixtypedef_PSTORVSC_REQUEST@
typedef PSTORVSC_REQUEST;
@@
-PSTORVSC_REQUEST
+struct hv_storvsc_request*
