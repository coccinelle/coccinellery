@match exists@
expression x, E;
identifier fld;
position p1,p2;
@@

(
x = E;
|
x = E
|
x@p1->fld
... when != x = E
IS_ERR(x@p2)
... when any
)

@other_match exists@
expression match.x, E1, E2;
position match.p1,match.p2;
@@

x = E1
... when != x = E2
    when != x@p1
x@p2

@ script:python depends on !other_match@
p1 << match.p1;
p2 << match.p2;
@@

print "* file %s dereference %s test %s" % (p1[0].file,p1[0].line,p2[0].line)
