//
//  Transform typedef HANDLE into void *
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Nicolas Palix <npalix@diku.dk>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@rem_handle@
@@
-typedef void* HANDLE;

@fix_handle@
typedef HANDLE;
@@
-HANDLE
+void*

@fix_sizeof_handle@
@@
-sizeof(HANDLE)
+sizeof(void*)
