//
//  Remove typedef STORVSC_REQUEST and PSTORVSC_REQUEST
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Nicolas Palix <npalix@diku.dk>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
