@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E=E1
      when != i
(
  if (E == NULL||
-     i
+     E->fld
       == NULL || ...) S
+ i = E->fld;
|
  BUG_ON (E == NULL||
-     i
+     E->fld
       == NULL || ...);
+ i = E->fld;
)

@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E=E1
      when != i
(
  if (E == NULL||...) S
+ i = E->fld;
|
  BUG_ON (E == NULL||...);
+ i = E->fld;
)
