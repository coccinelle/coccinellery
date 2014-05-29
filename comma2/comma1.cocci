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
let tbl = Hashtbl.create(100)

let add_if_not_present file =
try let _ = Hashtbl.find tbl file in ()
with Not_found ->
   Hashtbl.add tbl file ();
   let it = new iteration() in
   it#set_files [file];
   it#register()

@script:ocaml@
@@
Hashtbl.clear tbl

@r@
statement S1,S2;
expression e1,e2,e;
position p1,p2;
type T;
identifier i;
iterator I;
@@

(
if (...) S1 else S2
|
while (...) S1
|
for (...;...;...) S1
|
I (...) S1
|
T i;
|
 e;
)
 e1,@p1 e2@p2;

@script:ocaml@
p1 << r.p1;
p2 << r.p2;
@@

if (List.hd p1).line = (List.hd p2).line
then include_match false
else add_if_not_present ((List.hd p1).file)

@@
expression e1,e2;
position r.p1;
@@

 e1
- ,@p1
+ ;
  e2;

// ------------------------------------------------------------------------

@s disable braces3@
identifier f;
expression e1,e2;
position p1,p2;
@@

{
 e1,@p1 e2@p2;
 ... when any
}

@script:ocaml@
p1 << s.p1;
p2 << s.p2;
@@

if (List.hd p1).line = (List.hd p2).line
then include_match false
else add_if_not_present ((List.hd p1).file)

@@
expression e1,e2;
position s.p1;
@@

 e1
- ,@p1
+ ;
  e2;
