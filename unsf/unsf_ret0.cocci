@r exists@
identifier f;
constant C;
position p;
@@

static unsigned f(...) { <+...
  return@p -C;
...+> }

@zer exists@
identifier r.f;
constant C;
@@

static unsigned f(...) { <+...
  return 0;
...+> }

@ok@
expression x,E;
identifier r.f;
position p;
@@

x = f@p(...);
... when != x = E
if (!x) { ... return ...; }

@other@
identifier r.f;
position p1 != ok.p;
@@

f@p1

@depends on !other && zer@
position r.p;
constant C;
@@

- return@p -C;
+ return 0;
