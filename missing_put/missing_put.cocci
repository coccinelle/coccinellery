@@
identifier d;
type T;
expression e;
iterator for_each_node_by_name;
@@

T *d;
...
for_each_node_by_name(d,...)
  {... when != of_node_put(d)
       when != e = d
(
   return d;
|
+  of_node_put(d);
?  return ...;
)
...}

@@
identifier d;
type T;
expression e, e1;
@@

T *d;
...
for_each_node_by_name(d,...)
  {... when != of_node_put(d)
       when != e = d
+ of_node_put(d);
? break;
  ...}
... when != of_node_put(d)
    when != e1 = d
    when != return d;

// --------------------------------
@@
identifier d;
type T;
expression e;
iterator for_each_node_by_type;
@@

T *d;
...
for_each_node_by_type(d,...)
  {... when != of_node_put(d)
       when != e = d
(
   return d;
|
+  of_node_put(d);
?  return ...;
)
...}

@@
identifier d;
type T;
expression e, e1;
@@

T *d;
...
for_each_node_by_type(d,...)
  {... when != of_node_put(d)
       when != e = d
+ of_node_put(d);
? break;
  ...}
... when != of_node_put(d)
    when != e1 = d
    when != return d;

// --------------------------------
@@
identifier d;
type T;
expression e;
iterator for_each_compatible_node;
@@

T *d;
...
for_each_compatible_node(d,...)
  {... when != of_node_put(d)
       when != e = d
(
   return d;
|
+  of_node_put(d);
?  return ...;
)
...}

@@
identifier d;
type T;
expression e, e1;
@@

T *d;
...
for_each_compatible_node(d,...)
  {... when != of_node_put(d)
       when != e = d
+ of_node_put(d);
? break;
  ...}
... when != of_node_put(d)
    when != e1 = d
    when != return d;

// --------------------------------
@@
identifier d;
type T;
expression e;
iterator shost_for_each_device;
@@

T *d;
...
shost_for_each_device(d,...)
  {... when != scsi_device_put(d)
       when != e = d
(
   return d;
|
+  scsi_device_put(d);
?  return ...;
)
...}

@@
identifier d;
type T;
expression e, e1;
@@

T *d;
...
shost_for_each_device(d,...)
  {... when != scsi_device_put(d)
       when != e = d
+ scsi_device_put(d);
? break;
  ...}
... when != scsi_device_put(d)
    when != e1 = d
    when != return d;
