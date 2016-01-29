@@
expression root,e;
local idexpression child;
iterator name for_each_child_of_node;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_get(child)
*  of_node_put(child);
   ...
*  continue;
}
