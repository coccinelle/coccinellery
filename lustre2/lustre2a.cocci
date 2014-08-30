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
