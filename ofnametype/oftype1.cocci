@@
struct device_node *n;
struct device_node *n1;
struct device_node *n2;
statement S;
identifier f1,f2;
expression E1,E2;
constant C;
@@

n = of_find_node_by_type(...)
...
if (!n) S
... when != of_node_put(n)
    when != n1 = f1(n,...)
    when != E1 = n
    when any
    when strict
(
+ of_node_put(n);
  return -C;
|
  of_node_put(n);
|
  n2 = f2(n,...)
|
  E2 = n
|
  return ...;
)
