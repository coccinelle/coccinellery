//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
identifier lbl;
@@

if (...)
  GOTO(lbl,...);
+else
GOTO(lbl,...);

@@
identifier lbl,rc;
constant c;
expression e,e1;
@@

if (
-   e
+   !e
   )
-  GOTO(lbl,\(rc\|c\));
-else GOTO(lbl,e1);
+  e1;
+goto lbl;

@@
identifier lbl,rc;
constant c;
expression e,e1;
@@

if (e)
-  GOTO(lbl,e1);
-else GOTO(lbl,\(rc\|c\));
+  e1;
+goto lbl;

@@
identifier lbl;
expression e,e1,e2;
@@

if (e)
-  GOTO(lbl,e1);
-else GOTO(lbl,e2);
+  e1;
+else e2;
+goto lbl;

// ------------------------------------------------------------------------

@@
identifier lbl,rc;
constant c;
@@

- GOTO(lbl,\(rc\|c\));
+ goto lbl;

@@
identifier lbl;
expression rc;
@@

- GOTO(lbl,rc);
+ rc;
+ goto lbl;
