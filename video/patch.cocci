//
//  Use video_device_release rather than kfree
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* E = video_device_alloc(...);
  if (E == NULL) S
  ... when != video_device_release(...,(T1)E,...)
      when != if (E != NULL) { ... video_device_release(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != video_device_release(...,(T2)E,...)
        when != if (E != NULL) { ... video_device_release(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }

@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* if ((E = video_device_alloc(...)) == NULL)
  S
  ... when != video_device_release(...,(T1)E,...)
      when != if (E != NULL) { ... video_device_release(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != video_device_release(...,(T2)E,...)
        when != if (E != NULL) { ... video_device_release(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }
