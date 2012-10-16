//
// Avoid call to genlmsg_cancel
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression data;
@@

if (data == NULL) { ...
* genlmsg_cancel(..., data);
  ...
  return ...;
}