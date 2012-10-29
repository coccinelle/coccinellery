@r@
identifier f;
expression ret;
expression x,e1,e2,e3;
position p;
@@

f(...) { <...
ret = 0
... when != ret = e1
x@p = \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != ret = e2
if (x == NULL) { ... when != ret = e3
  return ret;
}
...>
}

@ok@
identifier r.f;
expression r.ret;
constant C;
@@

f(...) { <+...
(
 return -C;
|
 if (ret) { ... return ret; }
|
 ret = -C
)
...+> }

@depends on ok@
position r.p;
expression r.x;
@@

*x@p = \(kmalloc\|kcalloc\|kzalloc\)(...)
