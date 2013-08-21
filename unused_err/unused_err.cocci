@r@
local idexpression x;
constant C;
position p1,p2,p3;
@@

if (...) { ...
  x@p1 = -C
  ... when != x
(
  return@p2 <+...x...+>;
|
  return@p2 NULL;
|
  return@p2;
|
  return@p3 ...;
)
}

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

cocci.include_match(False)

@script:python@
p1 << r.p1;
p3 << r.p3;
@@

cocci.print_main("init",p1)
cocci.print_secs("ret",p3)