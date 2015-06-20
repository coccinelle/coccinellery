@@
expression x;
statement S1, S2;
@@

x = kzalloc(...);
if (
- x == NULL
+ !x
 ) S1 else S2