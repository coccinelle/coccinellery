@r@
expression E1,E2;
identifier fld;
statement S1,S2;
@@

E1 = E2->fld;
(
if (E1 == NULL) S1 else S2
|
*if (E2 == NULL) S1 else S2
)
