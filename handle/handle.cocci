//
//  Adjust error handling code
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
identifier f,err,l,l1;
type T;
expression x,E;
statement S;
@@

x = NULL
... when != goto l1;
* x = f(...)
... when != x
err = E;
goto l;
...
* if (x != NULL)
  S
return err;
