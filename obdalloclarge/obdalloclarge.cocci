@@
expression ptr,size;
@@

- OBD_ALLOC_LARGE(ptr,size)
+ ptr = libcfs_kvzalloc(size, GFP_NOFS)

// ----------------------------------------------------------------------

@@
expression ptr, size;
@@

- OBD_FREE_LARGE(ptr, size);
+ kvfree(ptr);
