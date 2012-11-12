//
// adjust array index
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r exists@
position p,p1;
expression ar,e1,e2;
@@

for@p(e1 = 0; e1 < e2; e1++) { <... ar@p1[e1] ...> }

@script:python@
p << r.p;
p1 << r.p1;
@@

cocci.include_match(False)

@s@
constant c;
expression e1,e2,ar;
position r.p;
@@

for@p(e1 = 0; e1 < e2; e1++) { <...
(
  ar[c]
|
  ar[
- e2
+ e1
  ]
)
  ...> }