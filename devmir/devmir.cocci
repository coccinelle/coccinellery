//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
expression dev,res,size,name,base;
identifier l;
@@

-if (!devm_request_mem_region(dev, res->start, size, name))
- { ... \(goto l;\|return ...;\) }
... when != res->start
base =
(
-devm_ioremap(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
|
-devm_ioremap_nocache(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
)
... when any
    when != res->start

@@
expression pdev,res,n,r.base,e1,e2;
identifier l,f,res1;
type T;
@@

(
(
  T res1 = f(pdev, IORESOURCE_MEM, n);
|
  res1 = f(pdev, IORESOURCE_MEM, n);
)
- if (res1 == NULL) { ... \(goto l;\|return ...;\) }
  base = devm_request_and_ioremap(e1, res1);
|
(
- res = f(pdev, IORESOURCE_MEM, n);
|
  T res1
-  = f(pdev, IORESOURCE_MEM, n)
  ;
)
  ... when != res
(
- if (res == NULL) { ... \(goto l;\|return ...;\) }
|
 if (
-     res == NULL ||
      e2
    ) { ... \(goto l;\|return ...;\) }
)
  ... when != res
+ res = f(pdev, IORESOURCE_MEM, n);
  base = devm_request_and_ioremap(e1, res);
)

@@
expression r.base, dev, res;
@@

base = 
- devm_request_and_ioremap
+ devm_ioremap_resource
 (dev, res);
 ...
 if (
-base == NULL
+IS_ERR(base)
 || ...) {
<...
-	return ...;
+	return PTR_ERR(base);
...>
 }

@@
expression r.base, dev, res;
@@

base = 
- devm_request_and_ioremap
+ devm_ioremap_resource
 (dev, res);

@@
expression r.base, E, ret;
identifier l;
@@

 base = devm_ioremap_resource(...);
 ...
 if (IS_ERR(base) || ...) {
 	... when any
-	ret = E;
+	ret = PTR_ERR(base);
 	...
(
 	return ret;
|
 	goto l;
)
 }

@@
expression r.base;
@@

 base = devm_ioremap_resource(...);
 ...
 if (IS_ERR(base) || ...) {
 	<...
-	\(dev_dbg\|dev_warn\|dev_err\|pr_debug\|pr_err\|DRM_ERROR\)(...);
 	...>
 }

@@
expression r.base;
identifier l;
@@

 base = devm_ioremap_resource(...);
 ...
 if (IS_ERR(base) || ...)
-{
(
 	return ...;
|
 	goto l;
)
-}
