//
//  use ARRAY_AND_SIZE consistently
//
// Target: Linux
// Copyright:  Copyright: 2014 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@call@
identifier f;
expression e;
expression list[n] es;
@@

f(es,ARRAY_AND_SIZE(e),...)

@@
expression e;
identifier call.f;
expression list[call.n] ess;
@@

f(ess,
- e,ARRAY_SIZE(e)
+ ARRAY_AND_SIZE(e)
  ,...)
