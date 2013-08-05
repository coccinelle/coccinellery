@r exists@
local idexpression ret;
constant C;
expression e1,e2;
identifier l;
position p1,p2,p3,p4,p5,p6;
@@

ret@p1 = -C;
...
if@p2 (...)
 {
  ... when any
 if@p3 (ret)
    { ...
     return@p4 ret;
    }
  ... when any
      when forall
      when != return ...;
      when != goto l;
 }
... when any
    when != ret = e1
if@p5 (...)
  { ... when != ret = e2
   return@p6 ret;
  }

@script:python@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
p4 << r.p4;
p5 << r.p5;
p6 << r.p6;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)
cocci.print_secs("",p3, "ovl-face3")
cocci.print_secs("",p4, "ovl-face3")
cocci.print_secs("",p5, "ovl-face4")
cocci.print_secs("",p6, "ovl-face4")
