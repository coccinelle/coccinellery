@@
iterator name for_each_node_by_name;
expression np,E;
identifier l;
@@

for_each_node_by_name(np,...) {
  ... when != break;
      when != goto l;
}
... when != np = E
- of_node_put(np);

@@
iterator name for_each_node_by_type;
expression np,E;
identifier l;
@@

for_each_node_by_type(np,...) {
  ... when != break;
      when != goto l;
}
... when != np = E
- of_node_put(np);

@@
iterator name for_each_compatible_node;
expression np,E;
identifier l;
@@

for_each_compatible_node(np,...) {
  ... when != break;
      when != goto l;
}
... when != np = E
- of_node_put(np);

@@
iterator name for_each_matching_node;
expression np,E;
identifier l;
@@

for_each_matching_node(np,...) {
  ... when != break;
      when != goto l;
}
... when != np = E
- of_node_put(np);
