@r exists@
local idexpression x;
expression E;
position p1,p2;
@@

if (x@p1 == NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\)
    when != &x
(
x@p2 == NULL
|
x@p2 != NULL
)

// another path to the test that is not through p1?

@s exists@
local idexpression r.x;
position r.p1,r.p2;
@@

... when != x@p1
(
x@p2 == NULL
|
x@p2 != NULL
)

// another path to the test from p1?

@t exists@
local idexpression x;
position r.p1,r.p2;
@@

if (x@p1 == NULL || ...) { ... x@p2 ... when any
   return ...; }

// another path to the test containing an assignment?

@u exists@
local idexpression x;
expression E;
position r.p1,r.p2;
@@

if (x@p1 == NULL || ...) { ... when forall
   return ...; }
 ...
 \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
 ...  when != x@p1
      when any
(
x@p2 == NULL
|
x@p2 != NULL
)

@fix depends on !s && !t && !u@
position r.p2;
expression x,E;
statement S1,S2;
@@

(
- if ((x@p2 != NULL) || ...)
  S1
|
- if ((x@p2 != NULL) || ...)
  S1
- else S2
|
- (x@p2 != NULL) && E
+ E
|
- (x@p2 == NULL) || E
+ E
|
- if ((x@p2 == NULL) && ...) S1
|
- if ((x@p2 == NULL) && ...) S1 else
  S2
|
- BUG_ON(x@p2 == NULL);
)

@script:python depends on !s && !t && !u && !fix@
p1 << r.p1;
p2 << r.p2;
@@

print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][%s::%s]]" % (p1[0].file,p1[0].line,p1[0].column,p1[0].column_end,p1[0].file,p1[0].line)
for i in p2:
	print "[[view:%s::face=ovl-face3::linb=%s::colb=%s::cole=%s][retest::%s]]" % (i.file,i.line,i.column,i.column_end,i.line)
