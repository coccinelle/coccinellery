@@
expression e1,e2,x;
@@
-	if (of_get_property(e1,e2,NULL))
-		x = \(true\|1\);
-	else
-		x = \(false\|0\);
+	x = of_property_read_bool(e1,e2);
