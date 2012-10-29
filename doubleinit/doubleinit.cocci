@r@
identifier I, s, fld;
position p0,p;
expression E;
@@

struct I s =@p0 { ... .fld@p = E, ...};

@s@
identifier I, s, r.fld;
position r.p0,p;
expression E;
@@

struct I s =@p0 { ... .fld@p = E, ...};

@script:python@
p0 << r.p0;
fld << r.fld;
ps << s.p;
pr << r.p;
@@

if int(ps[0].line) < int(pr[0].line) or int(ps[0].column) < int(pr[0].column):
  cocci.print_main(fld,p0)
  cocci.print_secs("s",ps)
  cocci.print_secs("r",pr)