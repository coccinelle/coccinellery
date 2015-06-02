//
//  Introduce missing initialization
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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