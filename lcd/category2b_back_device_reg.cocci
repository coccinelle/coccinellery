// category 2 should only have a IS_ERR test

@def0@ // save the file name, run with -no_includes
expression x;
@@

x = backlight_device_register(...)

// -----------------------------------------------------------------------

@protected using "../likely.iso" @
expression def0.x;
identifier fld;
position p,p1;
statement S;
expression E;
@@

(
if@p1 ((!IS_ERR(x))&&...) { <... x@p->fld ...> } else S
|
while@p1 ((!IS_ERR(x))&&...) { <... x@p->fld ...> }
|
for@p1 (...;(!IS_ERR(x))&&...;...) { <... x@p->fld ...> }
|
for@p1 (;(!IS_ERR(x))&&...;...) { <... x@p->fld ...> }
|
 ((!IS_ERR(x))&&...) ? <+... x@p->fld ...+> : E
|
 sizeof(<+... x@p->fld ...+>)
)

@andprotected using "../likely.iso"@
expression def0.x;
identifier fld;
position p,protected.p1;
statement S1,S2;
@@ // pb with associativity of && ||, so can't say X&&<+...E...+>

(
 if@p1 (<+...x@p->fld...+>) S1 else S2
|
 while@p1 (<+...x@p->fld...+>) S1
|
for@p1 (...;...;<+...x@p->fld...+>) S1
|
for@p1 (;...;<+...x@p->fld...+>) S1
)

@call@
expression def0.x;
position p1;
statement S1,S2;
@@

(
if (<+... x = backlight_device_register(...) ...+>) S1 else S2
|
while (<+... x = backlight_device_register(...) ...+>) S1
|
for (...;<+... x = backlight_device_register(...) ...+>;...) S1
|
x@p1 = backlight_device_register(...)
)

@unprotected using "../likely.iso" exists@
expression def0.x;
identifier fld, fld1, l;
position p != {protected.p,andprotected.p};
position call.p1;
statement S;
expression E,E1;
@@

 x@p1 = backlight_device_register(...)
  ... when != x = E
      when != &x
      when != x->fld1
(
  BUG_ON((IS_ERR(x))||...);
|
  if ((IS_ERR(x))||...) {
  ... when forall
  \(return ...; \| goto l; \| break; \| continue; \| panic(...); \| BUG(...);\)
  } else S
|
  if ((IS_ERR(x))||...) {
    ... when any,forall
    \(x = E1\|&x\)
    ... when any,forall
  } else S
|
  while ((IS_ERR(x))||...) S
|
  x@p->fld
)

@ script:python @
p << unprotected.p; // position of ref
p1 << call.p1; // position of call
fld << unprotected.fld; // identifier
@@

print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][%s::%s]]" % (p1[0].file,p1[0].line,p1[0].column,p1[0].column_end,p1[0].file,p1[0].line)
print "[[view:%s::face=ovl-face2::linb=%s::colb=%s::cole=%s][ref to field %s]]" % (p[0].file,p[0].line,p[0].column,p[0].column_end,fld)
print "call to backlight_device_register, ref to %s" % fld
