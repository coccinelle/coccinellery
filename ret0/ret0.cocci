@r exists@
local idexpression ret;
identifier reti;
expression e;
position p;
@@

ret@reti = 0;
... when != \(ret = e\|ret &= e\|ret |= e\|ret += e\|ret -= e\|ret *= e\|ret ^= e\)
    when != \(++ret\|--ret\|ret++\|ret--\)
    when != &ret
return ret;@p

@bad1 exists@
expression e != 0;
local idexpression r.ret;
position r.p;
@@

 \(ret = e\|ret &= e\|ret |= e\|ret += e\|ret -= e\|ret *= e\|ret ^= e\|++ret\|--ret\|ret++\|ret--\|&ret\)
 ...
 return ret;@p

@bad2 exists@
identifier r.reti;
position r.p;
identifier f;
type T;
@@

f(...,T reti,...) {
 ...
 return reti;@p
}

@change depends on !bad1 && !bad2@
position r.p;
local idexpression r.ret;
identifier f;
@@

f(...) { <+...
return 
-ret
+0
;@p
...+> }

@rewrite@
local idexpression r.ret;
expression e;
position p;
identifier change.f;
@@

f(...) { <+...
 \(ret@p = e\|&ret@p\)
...+> }

@depends on change@
local idexpression r.ret;
position p != rewrite.p;
identifier change.f;
@@

f(...) { <+...
(
break;
|
ret = 0;
... when exists
ret@p
... when any
|
- ret = 0;
)
...+> }

@depends on change@
identifier r.reti;
type T;
constant C;
identifier change.f;
@@

f(...) { ... when any
-T reti = C;
 ... when != reti
     when strict
 }

@depends on change@
identifier r.reti;
type T;
identifier change.f;
@@

f(...) { ... when any
-T reti;
 ... when != reti
     when strict
 }
