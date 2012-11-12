@r exists@ // find anything that might decrement the variable
identifier i;
expression E;
position p;
@@

  int i@p;
  ...
(
  &i
|
  i--
|
  --i
|
  i-=E
|
  i+=E
)

@x disable decl_init@
identifier r.i;
expression E;
position p1 != r.p;
@@

(
  volatile int i = 0;
|
  volatile int i;
|
+ unsigned
  int i@p1 = 0;
|
+ unsigned
  int i@p1;
)
  <... when != i = E      
(
  i = 0
|
  i = 1
)
  ...>

// @ script:python @
// p1 << x.p1;
// @@

// file  = p1[0].file
// p1line = p1[0].line
// p1colb = p1[0].column
// p1cole = p1[0].column_end
// print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][%s::%s]]" % (file,p1line,p1colb,p1cole,file,p1line)
