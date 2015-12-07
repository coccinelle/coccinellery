@@
expression E;
identifier fld;
@@

- !E && !E->fld
+ !E || !E->fld

@@
expression E;
identifier fld;
@@

- E || E->fld
+ E && E->fld
