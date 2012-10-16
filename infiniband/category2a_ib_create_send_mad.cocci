// category 2 should only have an IS_ERR test

@match disable isnt_null exists@
expression x, E, E3;
position p1,p2;
statement S1, S2;
@@

x@p1 = ib_create_send_mad(...)
... when != x = E
(
  if (x@p2) S1 else S2
|
  x@p2 && E3
|
  x@p2 || E3
|
  x@p2 == NULL
|
  x@p2 != NULL
|
  NULL != x@p2
)

@other_match disable isnt_null exists@
expression match.x, E1, E2, E3;
position p1!=match.p1,match.p2;
statement S1, S2;
@@

x@p1 = E1
... when != x = E2
(
  if (x@p2) S1 else S2
|
  x@p2 && E3
|
  x@p2 || E3
|
  x@p2 != NULL
|
  NULL != x@p2
|
  x@p2 == NULL
)

@ script:python depends on !other_match@
p1 << match.p1;
p2 << match.p2;
@@

file  = p1[0].file
p1line = p1[0].line
p1colb = p1[0].column
p1cole = p1[0].column_end
p2line = p2[0].line
p2colb = p2[0].column
p2cole = p2[0].column_end
print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][%s::%s]]" % (file,p1line,p1colb,p1cole,file,p1line)
print "[[view:%s::face=ovl-face2::linb=%s::colb=%s::cole=%s][%s: NULL test]]" % (file,p2line,p2colb,p2cole,p2line)

@match1 disable isnt_null@
expression x;
statement S1, S2;
expression E3;
position p;
@@

(
 if (x@p = ib_create_send_mad(...)) S1 else S2
|
 (x@p = ib_create_send_mad(...)) && E3
|
 (x@p = ib_create_send_mad(...)) || E3
|
 (x@p = ib_create_send_mad(...)) == NULL
|
 (x@p = ib_create_send_mad(...)) != NULL
|
 NULL != (x@p = ib_create_send_mad(...))
)

@ script:python @
p << match1.p;
@@

file  = p[0].file
pline = p[0].line
pcolb = p[0].column
pcole = p[0].column_end
print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][%s::%s]]" % (file,pline,pcolb,pcole,file,pline)
