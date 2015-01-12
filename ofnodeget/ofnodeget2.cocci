@r exists@
local idexpression x;
expression E,E1,E2;
position p1,p2,p3,p4;
statement S;
@@

x@p1 = \(of_find_node_by_path\|of_find_node_by_name\|of_find_node_by_phandle\|of_get_parent\|of_get_next_parent\|of_get_next_child\|of_find_compatible_node\|of_match_node\|of_find_node_by_type\|of_find_node_with_property\|of_find_matching_node\|of_parse_phandle\)(...);
...
if (x == NULL) S
<... when != x = E
if@p2 (...) {
  ... when != of_node_put(x)
      when != if (...) { ... of_node_put(x); ... }
(
  return <+...x...+>;
|
  return@p3 ...;
)
}
...>
E2@p4 = x;

@script:python@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
p4 << r.p4;
@@

cocci.print_main("call",p1)
cocci.print_secs("if",p2)
cocci.print_secs("return",p3,"ovl-face3")
cocci.print_secs("assignment",p4,"ovl-face4")