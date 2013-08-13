@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l;
@@

(
  res = platform_get_resource(pdev, IORESOURCE_MEM, n);
- if (res == NULL) { ... \(goto l;\|return ret;\) }
- e
+ e
  = devm_ioremap_resource(e1, res);
|
- res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  e = devm_ioremap_resource(e1, res);
)
