//
// use WARN
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
