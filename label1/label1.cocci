@r@
position p;
identifier l;
@@

if (...) goto l@p;
l:

@script:ocaml s@
p << r.p;
nm;
@@

nm := (List.hd p).current_element

@ok exists@
identifier s.nm,l;
position p != r.p;
@@

nm(...) {
<+... goto l@p; ...+>
}

@depends on !ok@
identifier s.nm;
position r.p;
identifier l;
@@

nm(...) {
<...
- if(...) goto l@p; l:
...>
}



