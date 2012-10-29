//
// introduce missing initialization
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression ret;
identifier f;
statement S1,S2;
@@

*ret = f(...);
if (\(ret != 0\|ret < 0\|ret == NULL\|IS_ERR(ret)\|IS_ERR_OR_NULL(ret)\)) S1
... when any
*f(...);
if (\(ret != 0\|ret < 0\|ret == NULL\|IS_ERR(ret)\|IS_ERR_OR_NULL(ret)\)) S2