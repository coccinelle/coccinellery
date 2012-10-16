@disable is_null@
identifier f;
expression E;
identifier fld;
statement S;
@@

+ if (E == NULL) S
  f(...,E->fld,...);
- if (E == NULL) S

@@
identifier f;
expression E;
identifier fld;
statement S;
@@

+ if (!E) S
  f(...,E->fld,...);
- if (!E) S
