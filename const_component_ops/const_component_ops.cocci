@initialize:ocaml@
@@

let check file =
  let second = List.nth (Str.split (Str.regexp "linux-next/") file) 1 in
  let doto =
    "/var/julia/linux-next/" ^ (Filename.chop_extension second) ^ ".o" in
  Sys.file_exists doto

@r disable optional_qualifier@
identifier i;
position p;
@@

static struct component_ops i@p = { ... };

@script:ocaml@
p << r.p;
@@

if false && not (check (List.hd p).file) then Coccilib.include_match false

@ok1@
identifier r.i;
expression e1;
position p;
@@

component_add(e1,&i@p)

@ok2@
identifier r.i;
expression e1;
position p;
@@

component_del(e1, &i@p)

@bad@
position p != {r.p,ok1.p,ok2.p};
identifier r.i;
struct component_ops e;
@@

e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct component_ops i = { ... };

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct component_ops i;
