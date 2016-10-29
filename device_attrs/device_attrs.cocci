@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@wo@
declarer name DEVICE_ATTR;
identifier x,x_store;
@@

DEVICE_ATTR(x, \(0200\|S_IWUSR\), NULL, x_store);

@rw@
declarer name DEVICE_ATTR;
identifier x,x_show,x_store;
@@

DEVICE_ATTR(x, \(0644\|S_IRUGO|S_IWUSR\), x_show, x_store);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@script:ocaml@
x << wo.x;
x_store << wo.x_store;
@@

if not (x^"_store" = x_store) then Coccilib.include_match false

@script:ocaml@
x << rw.x;
x_show << rw.x_show;
x_store << rw.x_store;
@@

if not (x^"_show" = x_show && x^"_store" = x_store)
then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);

@@
declarer name DEVICE_ATTR_WO;
identifier wo.x,wo.x_store;
@@

- DEVICE_ATTR(x, \(0200\|S_IWUSR\), NULL, x_store);
+ DEVICE_ATTR_WO(x);

@@
declarer name DEVICE_ATTR_RW;
identifier rw.x,rw.x_show,rw.x_store;
@@

- DEVICE_ATTR(x, \(0644\|S_IRUGO|S_IWUSR\), x_show, x_store);
+ DEVICE_ATTR_RW(x);
