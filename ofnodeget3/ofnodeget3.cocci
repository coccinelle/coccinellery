@r exists@
local idexpression x,y;
identifier g;
expression E1;
position p1,p2;
@@

x@p1 = \(of_find_node_by_path\|of_find_node_by_name\|of_find_node_by_phandle\|of_get_parent\|of_get_next_parent\|of_get_next_child\|of_find_compatible_node\|of_match_node\|of_find_node_by_type\|of_find_node_with_property\|of_find_matching_node\|of_parse_phandle\)(...);
... when != x = E1
(
y = of_node_get@p2(x) // local variable
|
g = of_node_get(x) // global variable
|
of_node_get@p2(x)
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

cocci.print_main("call",p1)
cocci.print_secs("get",p2)
