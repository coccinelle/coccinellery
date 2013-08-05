// Target: Linux

@@
expression err,x;
@@

-       err = PTR_ERR(x);
        if (IS_ERR(x))
-                return ERR_PTR(err);
+                return ERR_CAST(x);
