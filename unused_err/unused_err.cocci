//
//  Use available error codes
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
local idexpression x;
constant C;
position p1,p2,p3;
@@

if (...) { ...
  x@p1 = -C
  ... when != x
(
  return@p2 <+...x...+>;
|
  return@p2 NULL;
|
  return@p2;
|
  return@p3 ...;
)
}

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

cocci.include_match(False)

@script:python@
p1 << r.p1;
p3 << r.p3;
@@

cocci.print_main("init",p1)
cocci.print_secs("ret",p3)