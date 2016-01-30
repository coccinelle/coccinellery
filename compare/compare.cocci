@disable bitor_comm, neg_if_exp@
constant c,c1;
local idexpression i;
expression e,e1,e2;
binary operator b = {==,!=,&,|};
type t;
@@

(
c b (c1)
|
sizeof(t) b e1
|
sizeof e b e1
|
i b e1
|
c | e1 | e2 | ...
|
c | (e ? e1 : e2)
|
- c
+ e
b
- e
+ c
)

@disable gtr_lss, gtr_lss_eq, not_int2@
constant c,c1,c2;
expression e,e1,e2;
binary operator b;
binary operator b1 = {<,<=},b2 = {<,<=};
binary operator b3 = {>,>=},b4 = {>,>=};
local idexpression i;
type t;
@@

(
c b c1
|
sizeof(t) b e1
|
sizeof e b e1
|
 (e1 b1 e) && (e b2 e2)
|
 (e1 b3 e) && (e b4 e2)
|
i b e
|
- c < e
+ e > c
|
- c <= e
+ e >= c
|
- c > e
+ e < c
|
- c >= e
+ e <= c
)
