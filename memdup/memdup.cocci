//
// Use kmemdup
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r1@
expression from,to;
expression flag;
position p;
@@

   to = \(kmalloc@p\|kzalloc@p\)(strlen(from) + 1,flag);

@r2@
expression x,from,to;
expression flag,E1;
position p;
@@

    x = strlen(from) + 1;
    ... when != \( x = E1 \| from = E1 \)
    to = \(kmalloc@p\|kzalloc@p\)(x,flag);

@@
expression from,to,size,flag;
position p != {r1.p,r2.p};
statement S;
@@

-  to = \(kmalloc@p\|kzalloc@p\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to==NULL || ...) S
-  memcpy(to, from, size);
