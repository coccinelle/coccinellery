@@
expression E,E1;
@@

if (
-   E == NULL
+   IS_ERR(E)
   ) { <+... when != E = E1
        PTR_ERR(E)
       ...+> }
