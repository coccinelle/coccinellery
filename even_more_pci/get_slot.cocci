//
//  Add missing pci_dev_get
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// A pci_get_slot is not matched by a pci_put_slot before an error return.
//
// Confidence: Moderate
// Copyright: (C) Gilles Muller, Julia Lawall, EMN, DIKU.  GPLv2.
// URL: http://www.emn.fr/x-info/coccinelle/get_slot.html
// options: -no_includes -include_headers

@@
local idexpression *n;
statement S1,S2;
expression E,E1;
expression *ptr != NULL;
type T,T1;
@@

(
if (!(n = pci_get_slot(...))) S1
|
n = pci_get_slot(...)
)
<... when != pci_dev_put(n)
    when != if (...) { <+... pci_dev_put(n) ...+> }
    when != true !n  || ...
    when != n = (T)E
    when != E = n
if (!n || ...) S2
...>
(
  return \(0\|<+...n...+>\|ptr\);
|
+ pci_dev_put(n);
return ...;
|
pci_dev_put(n);
|
n = (T1)E1
|
E1 = n
)
