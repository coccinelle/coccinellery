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

static struct pinctrl_ops i@p = { ... };

@script:ocaml@
p << r.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok@
identifier r.i;
struct pinctrl_desc e;
position p;
@@

e.pctlops = &i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct pinctrl_ops e;
@@

e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct pinctrl_ops i = { ... };

// --------------------------------------------------------------------


@r1 disable optional_qualifier@
identifier i;
position p;
@@

static struct pinmux_ops i@p = { ... };

@script:ocaml@
p << r1.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok1@
identifier r1.i;
struct pinctrl_desc e;
position p;
@@

e.pmxops = &i@p;

@bad1@
position p != {r1.p,ok1.p};
identifier r1.i;
struct pinmux_ops e;
@@

e@i@p

@depends on !bad1 disable optional_qualifier@
identifier r1.i;
@@

static
+const
 struct pinmux_ops i = { ... };
