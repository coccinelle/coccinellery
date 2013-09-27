@r@
identifier f;
expression ret,e;
constant C;
@@

f(...) { <+...
(
return -C;
|
ret = -C
... when != ret = e
return ret;
|
if (ret < 0) { ... return ret; }
)
...+> }

@s@
identifier r.f,ret;
@@

f(...) { <+... return ret; ...+> }

@@
identifier r.f,s.ret;
expression e,e1,e2,e3,e4,x;
@@

f(...) { <+...
(
if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
|
ret = 0
)
... when != ret = e1
*x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
... when != x = e2
    when != ret = e3
*if (x == NULL || ...)
{
  ... when != ret = e4
*  return ret;
}
...+> }