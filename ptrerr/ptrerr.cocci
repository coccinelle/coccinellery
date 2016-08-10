@r exists@
expression e,e1;
position p1,p2;
@@

if (IS_ERR@p1(e)) {
  ...
(
  ret = PTR_ERR(e);
|
  ret = PTR_ERR@p2(e1);
)
  ...
  return ret;
}

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)