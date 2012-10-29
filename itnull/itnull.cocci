@@
iterator I;
expression x,E,E1,E2;
statement S,S1,S2;
@@

I(x,...) { <...
(
- if (x == NULL && ...) S
|
- if (x != NULL || ...)
  S
|
- (x == NULL) || 
  E
|
- (x != NULL) &&
  E
|
- (x == NULL && ...) ? E1 : 
  E2
|
- (x != NULL || ...) ? 
  E1
- : E2
|
- if (x == NULL && ...) S1 else
  S2
|
- if (x != NULL || ...)
  S1
- else S2
|
+ BAD(
  x == NULL
+ )
|
+ BAD(
  x != NULL
+ )
)
  ...> }