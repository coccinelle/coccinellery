//
//  Add of_node_put to avoid memory leak
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
expression x;
identifier f;
position p1,p2;
@@

x@p1->f = \(of_find_node_by_path\|of_find_node_by_name\|of_find_node_by_phandle\|of_get_parent\|of_get_next_parent\|of_get_next_child\|of_find_compatible_node\|of_match_node\|of_find_node_by_type\|of_find_node_with_property\|of_find_matching_node\|of_parse_phandle\|of_node_get\)(...);
... when != of_node_put(x)
kfree@p2(x)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

cocci.print_main("call",p1)
cocci.print_secs("free",p2)