//
// Correct use of request_region/request_mem_region
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
