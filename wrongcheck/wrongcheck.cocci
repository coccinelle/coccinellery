@r@
expression *e1;
expression *e2;
identifier f;
statement S1,S2;
position p,p2;
@@

 e1 = f@p(...,e2,...);
(
if (e1 == NULL || ...) S1 else S2
|
if (e1 != NULL || ...) S1 else S2
|
if@p2 (e2 == NULL || ...) S1 else S2
|
if@p2  (e2 != NULL || ...) S1 else S2
)

@ok@
expression e1,e2;
identifier f;
statement S1,S2;
position r.p,r.p2;
@@

 e1 = f@p(...);
(
if@p2 (e2 == NULL || ...) S1 else S2
|
if@p2  (e2 != NULL || ...) S1 else S2
)

@ok1 depends on ok exists@
position r.p;
expression *r.e2;
expression e3;
identifier f,g;
@@

e2->g
... when != e2 = e3
    when != &e2
f@p

@ok2 depends on ok exists@
position r.p;
expression *r.e2;
expression e,e3;
statement S1,S2;
identifier f;
@@

(
if (e2 == NULL || ...) {... return ...;} else S2
|
if (e2 != NULL || ...) S1 else {... return ...;}
)
... when != e2 = e3
    when != &e2
e = f@p(...);

@depends on ok1 || ok2@
expression e1;
identifier f;
position r.p;
@@

* e1 = f@p(...);
