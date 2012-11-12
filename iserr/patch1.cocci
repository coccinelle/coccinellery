@a@
expression E, E1;
statement S,S1;
position p;
@@

E = gfs2_inode_lookup(...)
... when != E = E1
if@p (E) S else S1

@n@
position a.p;
expression E,E1;
statement S,S1;
@@

E = NULL
... when != E = E1
if@p (E) S else S1

@depends on !n@
expression E;
statement S,S1;
position a.p;
@@

* if@p (E)
  S else S1
