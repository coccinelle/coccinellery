@@
expression x,E;
@@

(
*x = request_region(...)
|
*x = request_mem_region(...)
)
... when != release_region(x)
    when != release_mem_region(x)
    when != x = E
* release_resource(x);
