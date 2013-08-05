//
//  Correct use of request_region/request_mem_region
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
