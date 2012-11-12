@r exists@
parameter list[n] ps;
type T;
identifier a;
expression e;
expression ret != 0;
identifier f,free;
position p1;
@@

f(ps,T a,...) {
  ... when any
      when != a = e
  if(...) { ... free@p1(a); ... return ret; }
  ... when any
}

@s exists@
identifier r.f,r.free;
expression x,a;
position p2,p3;
expression list[r.n] xs;
@@

x = f@p2(xs,a,...);
if (...) { ... free@p3(a); ... return ...; }

@script:python@
p1 << r.p1;
p2 << s.p2;
p3 << s.p3;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)
cocci.print_secs("",p3)