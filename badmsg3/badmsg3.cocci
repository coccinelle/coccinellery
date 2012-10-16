@a@
identifier alloc != {kmalloc,kcalloc,kzalloc};
identifier ret;
constant C;
expression x;
@@

x = alloc(...);
if (x == NULL) { <+... \(ret = -C; \| return -C; \) ...+> }

@r@
identifier f, a.alloc;
expression ret;
expression x,e1,e2,e3;
position p;
@@

f(...) { <...
ret = 0
... when != ret = e1
x@p = alloc(...)
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
identifier a.alloc;
@@

*x@p = alloc(...)
