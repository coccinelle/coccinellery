@call@
local idexpression x;
position pc;
@@

x@pc = ALLOC(...)

@bad@
local idexpression x;
position call.pc;
@@

(
x@pc = list_entry(...)
|
x@pc = container_of(...)
)

@script:python depends on bad@
pc << call.pc;
@@

print "bad alloc ALLOC"
cocci.include_match(False)

@safe@
position p,pc;
identifier l;
local idexpression call.x;
@@

(
if ((x@pc = ALLOC(...)) == NULL) { <... goto@p l; ...> }
|
x = ALLOC(...);
... when != x
if (x@pc == NULL||...) { <... goto@p l; ...> }
)

@addr@
local idexpression call.x;
identifier f;
position p;
@@

&x@p->f

@r exists@
local idexpression call.x;
statement S;
expression E;
identifier f1,l;
position call.pc,p2,p3!=safe.p,p4!=addr.p;
iterator I;
@@

(
if ((x@pc = ALLOC(...)) == NULL) S
|
x@pc = ALLOC(...);
)
<... when != x
     when != true (x == NULL || ...)
     when != true (unlikely(x == NULL) || ...)
     when != true (x == 0 || ...)
     when != true (unlikely(x == 0) || ...)
     when != if (...) { <+...x...+> }
     when != I (...) { <+...x...+> }
(
 goto@p3 l;
|
 x == NULL
|
 x == E
|
 x@p4->f1
)
...>
(
 return 0;
|
 return <+...x...+>;
|
 return@p2 ...;
)

@script:python@
p1 << call.pc;
p2 << r.p2;
p3 << r.p3;
@@

file = p1[0].file
line1 = p1[0].line
colb1 = p1[0].column
cole1 = p1[0].column_end
line2 = p2[0].line
colb2 = p2[0].column
cole2 = p2[0].column_end
line3 = p3[0].line
colb3 = p3[0].column
cole3 = p3[0].column_end
print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][ALLOC: %s::%s]]" % (file,line1,colb1,cole1,file,line1)
print "[[view:%s::face=ovl-face2::linb=%s::colb=%s::cole=%s][return with no kfree: %s]]" % (file,line2,colb2,cole2,line2)
print "[[view:%s::face=ovl-face3::linb=%s::colb=%s::cole=%s][via goto: %s]]" % (file,line3,colb3,cole3,line3)
print "in function %s" % (p1[0].current_element)
print "bad alloc ALLOC"
cocci.include_match(False)

@script:python@
p1 << call.pc;
p2 << r.p2;
@@

file = p1[0].file
line1 = p1[0].line
colb1 = p1[0].column
cole1 = p1[0].column_end
line2 = p2[0].line
colb2 = p2[0].column
cole2 = p2[0].column_end
print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][ALLOC: %s::%s]]" % (file,line1,colb1,cole1,file,line1)
print "[[view:%s::face=ovl-face2::linb=%s::colb=%s::cole=%s][return with no kfree: %s]]" % (file,line2,colb2,cole2,line2)
print "in function %s" % (p1[0].current_element)
print "bad alloc ALLOC"
