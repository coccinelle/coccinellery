@r@
expression e,e1,e2;
position p1,p2;
@@

e@p1 = \(of_find_node_by_type\|of_find_node_by_name\)(...)
... when != of_node_put(e)
    when != true e == NULL
    when != e2 = e
e@p2 = e1

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if p1[0].line != p2[0].line:
  cocci.print_main("",p1)
  cocci.print_secs("",p2)