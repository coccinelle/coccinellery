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

let tbl = ref []
let fnstart = ref []
let success = Hashtbl.create 101
let thefile = ref ""
let parsed = ref []
let nea = ref []

let parse file =
  thefile := List.nth (Str.split (Str.regexp "linux-next/") file) 1;
  let i = open_in file in
  let startline = ref 0 in
  let fn = ref "" in
  let ids = ref [] in
  let rec inside n =
    let l = input_line i in
    let n = n + 1 in
    match Str.split_delim (Str.regexp_string "*/") l with
      before::after::_ ->
	(if not (!fn = "")
	then tbl := (!startline,n,!fn,List.rev !ids)::!tbl);
	startline := 0;
	fn := "";
	ids := [];
	outside n
    | _ ->
	(match Str.split (Str.regexp "[ \t]+") l with
	  "*"::name::rest ->
	    let len = String.length name in
	    (if !fn = "" && len > 2 && String.sub name (len-2) 2 = "()"
	    then fn := String.sub name 0 (len-2)
	    else if !fn = "" && (not (rest = [])) && List.hd rest = "-"
	    then
	      if String.get name (len-1) = ':'
	      then fn := String.sub name 0 (len-1)
	      else fn := name
	    else if not(!fn = "") && len > 2 &&
	      String.get name 0 = '@' && String.get name (len-1) = ':'
	    then ids := (String.sub name 1 (len-2)) :: !ids);
	| _ -> ());
	inside n
  and outside n =
    let l = input_line i in
    let n = n + 1 in
    if String.length l > 2 && String.sub l 0 3 = "/**"
    then
      begin
	startline := n;
	inside n
      end
    else outside n in
  try outside 0 with End_of_file -> ()

let hashadd tbl k v =
  let cell =
    try Hashtbl.find tbl k
    with Not_found ->
      let cell = ref [] in
      Hashtbl.add tbl k cell;
      cell in
  cell := v :: !cell

@script:ocaml@
@@

tbl := [];
fnstart := [];
Hashtbl.clear success;
parsed := [];
nea := [];
parse (List.hd (Coccilib.files()))

@r@
identifier f;
position p;
@@

f@p(...) { ... }

@script:ocaml@
p << r.p;
f << r.f;
@@

parsed := f :: !parsed;
fnstart := (List.hd p).line :: !fnstart

@param@
identifier f;
type T;
identifier i;
parameter list[n] ps;
parameter list[n1] ps1;
position p;
@@

f@p(ps,T i,ps1) { ... }

@script:ocaml@
@@

tbl := List.rev (List.sort compare !tbl)

@script:ocaml@
p << param.p;
f << param.f;
@@

let myline = (List.hd p).line in
let prevline =
  List.fold_left
    (fun prev x ->
      if x < myline
      then max x prev
      else prev)
    0 !fnstart in
let _ =
  List.exists
    (function (st,fn,nm,ids) ->
      if prevline < st && myline > st && prevline < fn && myline > fn
      then
	begin
	  (if not (String.lowercase f = String.lowercase nm)
	  then
	    Printf.printf "%s:%d %s doesn't match preceding comment: %s\n"
	      !thefile myline f nm);
	  true
	end
      else false)
    !tbl in
()

@script:ocaml@
p << param.p;
n << param.n;
n1 << param.n1;
i << param.i;
f << param.f;
@@

let myline = (List.hd p).line in
let prevline =
  List.fold_left
    (fun prev x ->
      if x < myline
      then max x prev
      else prev)
    0 !fnstart in
let _ =
  List.exists
    (function (st,fn,nm,ids) ->
      if prevline < st && myline > st && prevline < fn && myline > fn
      then
	begin
	  (if List.mem i ids then hashadd success (st,fn,nm) i);
	  (if ids = [] (* arg list seems not obligatory *)
	  then ()
	  else if not (List.mem i ids)
	  then
	    Printf.printf "%s:%d %s doesn't appear in ids: %s\n"
	      !thefile myline i (String.concat " " ids)
	  else if List.length ids <= n || List.length ids <= n1
	  then
	    (if not (List.mem f !nea)
	    then
	      begin
		nea := f :: !nea;
		Printf.printf "%s:%d %s not enough args\n" !thefile myline f;
	      end)
	  else
	    let foundid = List.nth ids n in
	    let efoundid = List.nth (List.rev ids) n1 in
	    if not(foundid = i || efoundid = i)
	    then
	      Printf.printf "%s:%d %s wrong arg in position %d: %s\n"
		!thefile myline i n foundid);
	  true
	end
      else false)
    !tbl in
()

@script:ocaml@
@@
List.iter
  (function (st,fn,nm,ids) ->
    if List.mem nm !parsed
    then
      let entry =
	try !(Hashtbl.find success (st,fn,nm))
	with Not_found -> [] in
      List.iter
	(fun id ->
	  if not (List.mem id entry) && not (id = "...")
	  then Printf.printf "%s:%d %s not used\n" !thefile st id)
	ids)
  !tbl
