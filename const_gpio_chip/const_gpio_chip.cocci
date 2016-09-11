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

static struct gpio_chip i@p = { ... };

@script:ocaml@
p << r.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok@
identifier r.i;
expression e;
position p;
@@

e = i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct gpio_chip e;
@@

e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct gpio_chip i = { ... };

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct gpio_chip i;
