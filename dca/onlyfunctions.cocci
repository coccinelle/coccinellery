//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

virtual after_start

@initialize:ocaml@
@@

let tbl = Hashtbl.create(100)
let res = Hashtbl.create(100)

let add_if_not_present i =
try let _ = Hashtbl.find tbl i in ()
with Not_found ->
   Hashtbl.add tbl i ();
   let it = new iteration() in
   (it#add_virtual_rule After_start;
   it#add_virtual_identifier Ty i;
   it#register())

let inc_good i file =
  let cell =
    try Hashtbl.find res i
    with Not_found ->
      let cell = ref (0,0,[]) in
      Hashtbl.add res i cell;
      cell in
  let (good,bad,files) = !cell in
  cell := (good+1,bad,if List.mem file files then files else file::files)

let inc_bad i file =
  let cell =
    try Hashtbl.find res i
    with Not_found ->
      let cell = ref (0,0,[]) in
      Hashtbl.add res i cell;
      cell in
  let (good,bad,files) = !cell in
  cell := (good,bad+1,if List.mem file files then files else file::files)

@r depends on !after_start@
identifier i;
@@

struct i { ... };

@s depends on !after_start@
field f;
identifier r.i;
@@

struct i {
...
f
...
};

@script:ocaml depends on !after_start@
f << s.f;
i << r.i;
@@

match Str.split (Str.regexp_string "( *") f with
  [before;after] -> Coccilib.include_match false
| _ -> ()

@t depends on !after_start@
identifier r.i;
position p;
@@

struct i@p { ... };

@q depends on !after_start@
position p != t.p;
identifier i;
@@

struct i@p { ... };

@script:ocaml@
i << q.i;
@@

add_if_not_present i

@m depends on after_start@
identifier virtual.ty,x;
position p;
@@

const struct ty x@p = { ... };

@script:ocaml@
p << m.p;
ty << virtual.ty;
@@

inc_good ty (List.hd p).file

@xx depends on after_start@
identifier virtual.ty,x;
position p != m.p;
@@

struct ty x@p = { ... };

@script:ocaml@
p << xx.p;
ty << virtual.ty;
@@

inc_bad ty (List.hd p).file

@n depends on after_start@
identifier virtual.ty,x;
position p;
@@

const struct ty x@p[...] = { ... };

@script:ocaml@
p << n.p;
ty << virtual.ty;
@@

inc_good ty (List.hd p).file

@yy depends on after_start@
identifier virtual.ty,x;
position p != n.p;
@@

struct ty x@p[...] = { ... };

/* options: --include-headers --no-includes */

@script:ocaml@
p << yy.p;
ty << virtual.ty;
@@

inc_bad ty (List.hd p).file

@finalize:ocaml@
@@

let common_files l =
  let l = List.sort compare l in
  let rec loop common = function
      [] -> common
    | l::rest ->
	let a = Str.split_delim (Str.regexp "/") l in
	let rec iloop common a =
	  match (common,a) with
	    ([],_) | (_,[]) -> []
	  | (x::xs,y::ys) ->
	      if x = y then x :: (iloop xs ys) else [] in
	loop (iloop common a) rest in
  String.concat "/"
    (loop (Str.split_delim (Str.regexp "/") (List.hd l)) (List.tl l)) in

let ftbl = Hashtbl.create 101 in

let hashadd k v =
  let cell =
    try Hashtbl.find ftbl k
    with Not_found ->
      let cell = ref [] in
      Hashtbl.add ftbl k cell;
      cell in
  cell := List.append v !cell in

let l = Hashtbl.fold (fun k v r -> (k,!v)::r) res [] in
let rec loop = function
    [] -> []
  | (((k:string),(g,b,files)) as l1)::rest ->
      let rest = loop rest in
      let (same,diff) =
	List.partition
	  (function l ->
	    List.exists
	      (function (k1,(g1,b1,files1)) ->
		not(Common.inter_set files files1 = []))
	      l)
	  rest in
      match same with
	[] -> [l1] :: diff
      | _ -> (l1::List.concat same) :: diff in
let l = loop l in
List.iter
  (function l ->
    let files =
      Common.nub
	(List.concat
	   (List.map (function ((k:string),(g,b,files)) -> files) l)) in
    let file = common_files files in
    hashadd file l)
l;
let l = Hashtbl.fold (fun k v r -> (k,!v)::r) ftbl [] in
let one (_,(x,_,_)) = x in
let two (_,(_,x,_)) = x in
let l =
  List.sort compare
    (List.map
       (function (k,l) ->
	 let allg = List.fold_left (+) 0 (List.map one l) in
	 let allb = List.fold_left (+) 0 (List.map two l) in
	 (allg+allb,allg,allb,k,
	  List.sort
	    (fun ((s:string),(g1,b1,_)) (_,(g2,b2,_)) ->
	      let sum1 = g1 + b1 in
	      let sum2 = g2 + b2 in
	      match compare sum1 sum2 with
		0 -> compare g1 g2
	      | n -> n)
	    l))
       l) in
List.iter
  (function (_,_,bad,k,l) ->
    if bad > 0
    then
      begin
	Printf.eprintf "k %s\n" k;
	(match Str.split (Str.regexp "linux-next/") k with
	  _::s::_ -> Printf.printf "%s\n" s
	| _ -> Printf.printf "%s\n" k);
	List.iter
	  (function (k,(g,b,_)) ->
	    if b > 0
	    then Printf.printf "   %s: \tgood: %d, bad: %d\n" k g b)
	  l
      end)
  l

