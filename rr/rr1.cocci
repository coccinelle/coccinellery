@r@
expression start,E;
@@

- request_region
+ request_mem_region
  (start,...)
... when != request_mem_region(start,...)
    when != start = E
ioremap(start,...)

@@
expression r.start;
@@

- release_region
+ release_mem_region
  (start,...)
