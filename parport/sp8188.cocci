@rule8188 exists@
local idexpression struct parport * x;
expression ra,rr;
identifier fa;
position p1,p2;
statement S1,S2;
@@

x = parport_find_number@p1(...)
... when != x = rr
    when != fa(...,x,...)
    when any
    when != true x == NULL
     when != true ERR_PTR(x)
     when != parport_put_port(x,...)
     when != if (...) { ... parport_put_port(x,...) ...}
(
if(<+...x...+>) S1 else S2
|
if(...) { ... when != x = ra
      when forall
     when != parport_put_port(x,...)
return@p2...; }
)

@script:python@
p1 << rule8188.p1;
p2 << rule8188.p2;
@@

cocci.print_main("8188: parport_find_number: parport_put_port",p1)
cocci.print_secs("",p2)

