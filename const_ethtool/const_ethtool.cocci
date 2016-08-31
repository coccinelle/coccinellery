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

static struct ethtool_ops i@p = { ... };

@script:ocaml@
p << r.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok1@
identifier r.i;
struct net_device e;
position p;
@@

e.ethtool_ops = &i@p;

@ok2@
identifier r.i;
expression e;
position p;
@@

netdev_set_default_ethtool_ops(e, &i@p)

@bad@
position p != {r.p,ok1.p,ok2.p};
identifier r.i;
@@

i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct ethtool_ops i = { ... };
