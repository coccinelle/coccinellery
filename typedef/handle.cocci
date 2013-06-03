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
