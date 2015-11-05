@r@
position p;
expression e;
identifier l;
statement S;
@@

l@p:
 if (e) S
 return e;

@script:ocaml s@
p << r.p;
nm;
@@

nm := (List.hd p).current_element

@ok@
identifier s.nm,r.l;
expression r.e,x;
position p,pe;
@@

nm(...) {
<...
e@pe = x;
if (e) goto@p l;
...>
}

@bad exists@
identifier s.nm,r.l;
expression r.e,x;
position p != ok.p;
position pe != ok.pe;
@@

nm(...) {
... when any
(
goto@p l;
|
e@pe = x
)
... when any
}

@depends on !bad@
identifier s.nm,r.l;
expression r.e;
statement S;
position r.p;
@@

nm(...) {
<+...
+ return 0;
l@p:
-if (e)
 S
 return e;
...+>
}
