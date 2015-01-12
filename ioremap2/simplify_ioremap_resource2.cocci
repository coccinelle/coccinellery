@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l,f != platform_get_resource;
expression list es;
@@

(
  res = f(...);
- if (res == NULL) { ... \(goto l;\|return ret;\) }
- e
+ e
  = devm_ioremap_resource(e1, res);
|
- res = f(es);
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = f(es);
  e = devm_ioremap_resource(e1, res);
)
