//
//  Use WARN
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@bad1@
position p;
@@

printk(...);
printk@p(...);
WARN_ON(1);

@ok1@
expression list es;
position p != bad1.p;
@@

-printk@p(
+WARN(1,
  es);
-WARN_ON(1);

@@
expression list ok1.es;
@@

if (...)
- {
  WARN(1,es);
- }

@bad2@
position p;
@@

printk(...);
printk@p(...);
WARN_ON_ONCE(1);

@ok2@
expression list es;
position p != bad2.p;
@@

-printk@p(
+WARN_ONCE(1,
  es);
-WARN_ON_ONCE(1);

@@
expression list ok2.es;
@@

if (...)
- {
  WARN_ONCE(1,es);
- }
