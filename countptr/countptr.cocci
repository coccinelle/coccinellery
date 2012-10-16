@script:python@
@@

with_and = 0
without_and = 0

@r@
identifier f;
@@

f(...) { ... }

@addr1@
identifier r.f;
position pa;
@@

 &f@pa

@script:python@
p << addr1.pa;
@@

with_and = with_and + 1

@r1@
identifier r.f;
position p;
declarer name  EXPORT_SYMBOL;
@@

(
EXPORT_SYMBOL(f@p);
|
module_init(f@p);
|
module_exit(f@p);
|
f@p(...)
)

@noaddr1@
identifier r.f;
position pn != r1.p;
@@

(
  &f
|
 f@pn
)

@script:python@
p << noaddr1.pn;
@@

without_and = without_and + 1

@script:python@
@@

choose_without_and = False
#if (with_and * 25 < without_and):
#  choose_without_and = True
if (with_and == 1 and without_and > 9):
  choose_without_and = True

choose_with_and = False
#if (without_and * 25 < with_and):
#  choose_with_and = True
if (without_and == 1 and with_and > 9):
  choose_with_and = True

@script:python@
p << addr1.pa;
f << r.f;
@@

if (choose_with_and or not choose_without_and):
  cocci.include_match(False)

@script:python@
p << noaddr1.pn;
f << r.f;
@@

if (choose_without_and or not choose_with_and):
  cocci.include_match(False)

@@
identifier f;
position addr1.pa;
position noaddr1.pn;
@@

(
- &f@pa
+ f
|
- f@pn
+ &f
)