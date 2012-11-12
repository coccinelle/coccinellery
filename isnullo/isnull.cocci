@r@
expression E, E1;
identifier f;
statement S1,S2,S3;
iterator I;
position p1,p2;
@@

if@p1 (E == NULL)
{
  ... when != if (E == NULL || ...) S1 else S2
      when != I(...,E,...) S1
      when != E = E1
E@p2->f
  ... when any
  return ...;
}
else S3

@@
expression e <= r.E;
expression E, E1;
identifier f;
statement S1,S2,S3;
iterator I;
position r.p1,r.p2;
@@

if@p1 (E == NULL)
{
  ... when != e = E1
* E@p2->f
  ... when any
  return ...;
}
else S3
