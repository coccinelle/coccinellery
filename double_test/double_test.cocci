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