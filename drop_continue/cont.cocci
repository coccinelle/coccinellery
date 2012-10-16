//
// Drop unnecessary continue
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
