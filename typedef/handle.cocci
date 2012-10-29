//
// Description not available
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Author name not available
//

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
