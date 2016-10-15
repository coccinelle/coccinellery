//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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

static struct l3mdev_ops i@p = { ... };

@script:ocaml@
p << r.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok1@
identifier r.i;
struct net_device e;
position p;
@@

e.l3mdev_ops = &i@p;

@ok2@
identifier r.i, e;
position p;
@@

struct net_device e[] = { ..., { .l3mdev_ops = &i@p, }, ..., };

@ok3@
identifier r.i, e;
expression e1;
position p;
@@

struct net_device e[] = { ..., [e1] = { .l3mdev_ops = &i@p, }, ..., };

@bad@
position p != {r.p,ok1.p,ok2.p,ok3.p};
identifier r.i;
struct l3mdev_ops e;
@@

e@i@p

@script:ocaml@
p << bad.p;
@@

Printf.eprintf "check on %s:%d\n" (List.hd p).file (List.hd p).line

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct l3mdev_ops i = { ... };

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct l3mdev_ops i;
