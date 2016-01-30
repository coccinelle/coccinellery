@match_bad_null_test@
expression x, E;
statement S1,S2;
@@
x = p9_client_walk(...)
... when != x = E
*  if (x != NULL) 
S1 else S2
