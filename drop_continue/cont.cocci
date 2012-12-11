//
//  Drop unnecessary continue
//
// Target:  Linux, Generic
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
statement S;
@@

while (...) {
  ...
  if (...)
- {
    S
-   continue;
- }
}

@@
statement S;
@@

for (...;...;...) {
  ...
  if (...)
- {
    S
-   continue;
- }
}

@@
@@

while (...) {
  ...
  if (...) {
    ...
-   continue;
  }
}

@@
@@

for (...;...;...) {
  ...
  if (...) {
    ...
-   continue;
  }
}
