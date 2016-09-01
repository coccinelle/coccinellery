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

static struct snd_soc_codec_driver i@p = { ... };

@script:ocaml@
p << r.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok@
identifier r.i;
expression e1,e2,e3;
position p;
@@

(
snd_soc_register_codec(e1,&i@p,e2,e3)
|
memcpy(e1,&i@p,e2)
)

@bad@
position p != {r.p,ok.p};
identifier r.i;
@@

i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct snd_soc_codec_driver i = { ... };
