@@
expression e1,e2;
statement S2,S1;
@@

-       if (of_get_property(e1,e2,NULL))
+       if (of_property_read_bool(e1,e2))
        S1 else S2
