@@
expression x,y,flags;
statement S;
type T;
@@

x = 
-   kmalloc
+   kcalloc
           (
-           y * sizeof(T),
+           y, sizeof(T),
                flags);
 if (x == NULL) S
-memset(x, 0, y * sizeof(T));

@@
expression x,y,z,flags;
statement S;
@@

x = 
-   kmalloc
+   kcalloc
           (
-           y * sizeof(z),
+           y, sizeof(z),
                flags);
 if (x == NULL) S
-memset(x, 0, y * sizeof(z));

@@
expression x,size,flags;
statement S;
@@

x = 
-   kmalloc
+   kzalloc
           (size,flags);
 if (x == NULL) S
-memset(x, 0, size);
