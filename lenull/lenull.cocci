@r@
expression x,E;
statement S1,S2;
position p,p1;
@@

x = list_entry@p(...)
... when != x = E
if@p1 (x == NULL) S1 else S2

@other@
position r.p,r.p1;
statement S1,S2;
@@

... when != list_entry@p(...)
if@p1 (...) S1 else S2

@yetanother@
position r.p,r.p1;
statement S1,S2;
expression x,E;
@@

x = list_entry@p(...)
...
x = E
...
if@p1 (x == NULL) S1 else S2

@depends on !other && !yetanother@
expression x,E;
statement S1,S2;
position r.p,r.p1;
@@

*x = list_entry@p(...)
... when != x = E
*if@p1 (x == NULL)
 S1 else S2
