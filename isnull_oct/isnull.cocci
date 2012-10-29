//
// eliminate a null pointer dereference
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
expression E, E1, E2;
identifier f;
statement S1,S2,S3;
iterator I;
position p1,p2;
@@

if@p1 (E == NULL)
{
  ... when != if (E == NULL || ...) S1 else S2
      when != I(...,E,...) S1
      when != \(E = E1\|E--\|E++\)
(
  E && E2
|
  E@p2->f
)
  ... when any
  return ...;
}
else S3

@@
expression e <= r.E;
expression E, E1;
identifier f;
statement S3;
position r.p1,r.p2;
@@

if@p1 (E == NULL)
{
  ... when != \(e = E1\|e--\|e++\)
* E@p2->f
  ... when any
  return ...;
}
else S3
