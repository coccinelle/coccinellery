//
//  Use an IS_ERR test rather than a NULL test
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julien Brunel <brunel@diku.dk>
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// category 2 should only have an IS_ERR test

@match exists@
expression x, E;
position p1,p2;
statement S1,S2;
@@

x@p1 = 
(
  dasd_kmalloc_request(...)
|
  idal_buffer_alloc(...)
)
... when != x = E
(
  if (x@p2 == NULL && ...) S1 else S2
|
  if (x@p2 == NULL || ...) S1 else S2
)

@other_match exists@
expression match.x, E1, E2;
position p1!=match.p1,match.p2;
statement S1, S2;
@@

x@p1 = E1
... when != x = E2
(
  if (x@p2 == NULL && ...) S1 else S2
|
  if (x@p2 == NULL || ...) S1 else S2
)

@corr_null depends on !other_match @
expression x,E;
statement S1, S2;
position match.p2;
@@
x = 
(
  dasd_kmalloc_request(...)
|
  idal_buffer_alloc(...)
)
<... when != x = E
if (
(
- x@p2 != NULL
+ ! IS_ERR ( x )
|
- x@p2 == NULL
+ IS_ERR( x )
)
 )
S1
else S2
...>
? x = E;



