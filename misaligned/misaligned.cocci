@bad@
statement S;
expression e;
position p1,p;
@@

S@p1
e@p;

@script:ocaml@
p1 << bad.p1;
p << bad.p;
@@

if not ((List.hd p1).line = (List.hd p).line)
then include_match false

@r@
expression e1,e2;
position p1 != bad.p,p2;
@@

e1@p1;
e2@p2;

@script:ocaml@
p1 << r.p1;
p2 << r.p2;
@@

if not ((List.hd p1).col = (List.hd p2).col) &&
   not ((List.hd p1).line = (List.hd p2).line)
then begin print_main "" p1; print_secs "" p2 end