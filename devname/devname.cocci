@@
expression dev,E;
@@

*dev_name(dev)
... when != dev = E
(
*dev == NULL
|
*dev != NULL
)