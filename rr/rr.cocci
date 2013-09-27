//
//  Correct use of request_region/request_mem_region
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r1@
expression start;
@@

request_region(start,...)

@b1@
expression r1.start;
@@

request_mem_region(start,...)

@depends on !b1@
expression r1.start;
expression E;
@@

- release_mem_region
+ release_region
  (start,E)

@r2@
expression start;
@@

request_mem_region(start,...)

@b2@
expression r2.start;
@@

request_region(start,...)

@depends on !b2@
expression r2.start;
expression E;
@@

- release_region
+ release_mem_region
  (start,E)
