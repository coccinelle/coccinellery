@s exists@
position p1;
expression e1,e2;
@@

e1 = clk_get@p1(...);
... when != e1 = e2
clk_put(e1)

@r exists@
expression e1,e2;
position s.p1,p2,p3;
statement S,S1;
int x;
@@

e1 = clk_get@p1(...);
... when != e1 = e2
    when != clk_put(e1)
    when any
(
 if (<+...e1...+>) S else S1
|
  if (x == 0) { ... return x; }
|
  if(...) { ... return 0; }
|
if@p2 (...) { ... when != clk_put(e1)
               when != if (...) { ... clk_put(e1) ... }
 return@p3 ...; } else S
)

@script:python@
p1 << s.p1;
p2 << r.p2;
p3 << r.p3;
@@

cocci.print_main("clk_get",p1)
cocci.print_secs("if",p2)
cocci.print_secs("return",p3)
