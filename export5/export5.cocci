//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// run with the options -in_place and -dir {directory}

virtual after_start
virtual after_start2
virtual after_start3

@initialize:ocaml@
@@

type use = NOTUSED | LOCALUSE | NONLOCALUSE

let restarted = ref false
let restarted2 = ref false
let restarted3 = ref false
let tbl = Hashtbl.create(101)
let disordered = ref []

let inlinux fl =
  List.mem "linuxcopy" (Str.split (Str.regexp "/") fl)

let add_if_not_present fn file ln =
  (if inlinux file && not (Hashtbl.mem tbl fn)
   then Hashtbl.add tbl fn (ref NOTUSED,file,ln));
  if not !restarted
  then
    begin
      Printf.eprintf "restarting\n";
      restarted := true;
      let it = new iteration() in
      it#add_virtual_rule After_start;
      it#register()
    end

let add_if_not_present2 _ =
  if not !restarted2
  then
    begin
      Printf.eprintf "restarting2\n";
      restarted2 := true;
      let it = new iteration() in
      it#add_virtual_rule After_start2;
      it#register()
    end

let tbl_local = Hashtbl.create(100)

let add_if_not_present_localused f file =
try let _ = Hashtbl.find tbl_local (f,file) in ()
with Not_found ->
   Hashtbl.add tbl_local (f,file) ();
   let it = new iteration() in
   it#set_files [file];
   it#add_virtual_rule After_start3;
   it#add_virtual_identifier Keep f;
   it#register()

let compileable file =
  let ofile = (Filename.chop_extension file) ^ ".o" in
  Sys.file_exists ofile

let old_date file ln =
  Printf.eprintf "file before %s\n" file;
  let file = List.hd (Str.split (Str.regexp "/var/julia/linuxcopy/") file) in
  Printf.eprintf "file after %s\n" file;
  let cmd =
    Printf.sprintf "cd /var/linuxes/linux-next; git blame -L %d,%d %s"
      ln ln file in
  let info = Common.cmd_to_list cmd in
  Printf.eprintf "result of %s\n" cmd;
  List.iter
    (function x -> Printf.eprintf "%s\n" x)
    info;
  match info with
    x::_ ->
      (match Str.split (Str.regexp "-") x with
	x::mo::_ ->
	  (match List.rev (Str.split (Str.regexp " ") x) with
	    x::_ ->
	      if x = "2015"
	      then false
	      else if x = "2014"
	      then List.mem mo ["01";"02";"03";"04"]
	      else true
	  | _ -> false)
      |	_ -> false)
  | _ -> false

@pre depends on !after_start && !after_start2 && !after_start3@
declarer decl;
identifier fn;
position p;
@@

decl(fn@p);

@r depends on !after_start && !after_start2 && !after_start3 exists@
identifier pre.fn;
declarer name EXPORT_SYMBOL;
position pre.p;
@@

EXPORT_SYMBOL(fn@p);

@rr depends on !after_start && !after_start2 && !after_start3 exists@
identifier pre.fn;
declarer name EXPORT_SYMBOL_GPL;
position p;
@@

EXPORT_SYMBOL_GPL(fn@p);

@script:ocaml@
@@

disordered := []

@def depends on r || rr@
identifier pre.fn;
position p;
@@
fn@p(...) { ... }

@use depends on r || rr@
identifier pre.fn;
position p1;
@@
fn@p1

@script:ocaml@
defp << def.p;
usep << use.p1;
fn << pre.fn;
@@

let deffile = (List.hd defp).file in
let usefile = (List.hd usep).file in
let defline = (List.hd defp).line in
let useline = (List.hd usep).line in
if not (deffile = usefile) or (useline < defline)
then disordered := fn :: !disordered

@script:ocaml depends on r || rr@
fn << pre.fn;
p << pre.p;
@@

let file = (List.hd p).file in
if not (List.mem fn !disordered) && compileable file
then add_if_not_present fn file (List.hd p).line

// -----------------------------------------------------------------------
// find bugs

@e1 depends on after_start@
position p;
expression e;
@@
EXPORT_SYMBOL(e@p);

@e2 depends on after_start@
position p;
expression e;
@@
EXPORT_SYMBOL_GPL(e@p);

@e depends on after_start exists@
global idexpression exp;
position p != {e1.p,e2.p};
@@

exp@p

@script:ocaml depends on after_start@
f << e.exp;
p << e.p;
@@

add_if_not_present2();
let reffile = (List.hd p).file in
try
  let (cell,fl,_) = Hashtbl.find tbl f in
  match !cell with
    NOTUSED ->
      if inlinux reffile
      then (if fl = reffile then cell := LOCALUSE else cell := NONLOCALUSE)
  | LOCALUSE ->
      if not (fl = reffile) && inlinux reffile then cell := NONLOCALUSE
  | NONLOCALUSE -> ()
with Not_found -> ()

@script:ocaml depends on after_start2@
@@

if not !restarted3
then begin
restarted3 := true;
Hashtbl.iter
    (fun key (cell,file,ln) ->
      match !cell with
	NOTUSED -> () (*
	  Printf.printf "NOTUSED: %s: %s: %d\n" key file ln;
	  add_if_not_present_notused key file *)
      | LOCALUSE ->
	  Printf.printf "LOCALUSED: %s: %s: %d\n" key file ln;
	  if old_date file ln
	  then
	    (Printf.eprintf "old date returned true\n";
	    add_if_not_present_localused key file)
	  else Printf.eprintf "old date returned false\n"
      | NONLOCALUSE -> ())
    tbl
end

@depends on after_start3@
identifier virtual.keep;
type T;
@@

-extern T keep(...);

@depends on after_start3@
identifier virtual.keep;
type T;
@@

+static
T keep(...);

@depends on after_start3@
identifier virtual.keep;
type T;
@@

+static
T keep(...) { ... }

@depends on after_start3@
identifier virtual.keep;
@@

-EXPORT_SYMBOL(keep);

@depends on after_start3@
identifier virtual.keep;
@@

-EXPORT_SYMBOL_GPL(keep);
