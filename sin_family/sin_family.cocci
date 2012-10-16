//
// Use AF_INET for sin_family field
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
struct sockaddr_in sip;
@@

(
sip.sin_family ==
- PF_INET
+ AF_INET
|
sip.sin_family !=
- PF_INET
+ AF_INET
|
sip.sin_family =
- PF_INET
+ AF_INET
)
