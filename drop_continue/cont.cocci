//
//  Drop unnecessary continue
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
statement S;
@@

while (...) {
  ...
  if (...)
  {
+   DROP_ME();
    S
-   continue;
  }
}

@@
statement S;
@@

for (...;...;...) {
  ...
  if (...)
  {
+   DROP_ME();
    S
-   continue;
  }
}

@@
statement S;
@@
  if (...)
- {
-   DROP_ME();
    S
- }

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
