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

static struct fb_var_screeninfo i@p = { ... };

@script:ocaml@
p << r.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok@
identifier r.i;
expression e;
position p;
@@

e = i@p

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct fb_var_screeninfo e;
@@

e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct fb_var_screeninfo i = { ... };
