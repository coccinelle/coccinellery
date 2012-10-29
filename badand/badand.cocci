@disable and_comm@
expression E;
identifier fld;
@@

- !E && !E->fld
+ !E || !E->fld

@disable or_comm@
expression E;
identifier fld;
@@

- E || E->fld
+ E && E->fld
