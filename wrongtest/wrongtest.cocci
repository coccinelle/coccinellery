@r@
identifier a,x,y,f!={PTR_ERR,ERR_PTR,ERR_CAST};
statement S;
@@

(
a = f(...,&x,...);
if (\(x == NULL\|IS_ERR(x)\)) S
|
x = f(...);
(
if (\(x == NULL\|IS_ERR(x)\)) S
|
*if (\(y == NULL\|IS_ERR(y)\))
 { ... when != x
   return ...; }
)
)