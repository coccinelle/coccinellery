@r exists@
identifier f;
identifier C;
@@

f(...) { ... return C; }

@s@
identifier r.C;
expression E;
@@

#define C E

@@
identifier r.f;
identifier r.C;
expression s.E;
identifier I;
@@

f(...) {
 <...
(
  I
|
- E
+ C
)
 ...>
}
