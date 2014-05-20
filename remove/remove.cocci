@r@
struct platform_driver I;
identifier a,f;
position p;
@@

I.remove = \(f@p\|a(f@p)\);

@void_called@
identifier r.f;
position p;
@@

f@p(...);

@called@
identifier r.f;
position p1 != void_called.p;
@@

f@p1(...)

@localfn@
identifier r.f;
@@

static int f(...) { ... }

@depends on !called && localfn@
struct platform_driver I;
identifier a,f;
position r.p;
@@

I.
- remove
+ remove_new
   = \(f@p\|a(f@p)\);

@depends on !called && localfn@
identifier r.f,i;
constant C;
expression E;
@@

- int
+ void
       f(...) {
  <...
(
-  return \(C\|i\);
+  return;
|
-  return E;
+  E;
+  return;
)
  ...>
}

@one depends on !called && localfn@
identifier r.f;
position p;
statement S;
@@


f(...) {
  <...
  if (...) { <... return@p; ...> } else S
  ...>
}

@two depends on !called && localfn@
identifier r.f;
position p;
statement S;
@@

f(...) {
  <...
  if (...) S else { <... return@p; ...> }
  ...>
}

@depends on !called && localfn@
position p != {one.p,two.p};
identifier r.f;
@@

f(...) {
  <...
- return@p;
  ...>
}
