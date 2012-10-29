//
// use devm_ functions
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
