//
//  Add missing iounmap
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression e;
statement S,S1;
int ret;
@@

e = \(ioremap\|ioremap_nocache\)(...)
... when != iounmap(e)
if (<+...e...+>) S
... when any
    when != iounmap(e)
    when != if (...) { ... iounmap(e); ... }
(
 if (ret == 0) S1
|
*if (...)
   { ... when != iounmap(e)
         when != if (...) { ... iounmap(e); ... }
     return ...; }
)
... when any
iounmap(e);
