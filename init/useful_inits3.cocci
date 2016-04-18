// No iteration.  Do it by hand.

@initialize:ocaml@
@@

let itbl = Hashtbl.create 101
let ltbl = Hashtbl.create 101
let thefile = ref ""

let hashadd t k =
  let cell =
    try Hashtbl.find t k
    with Not_found ->
      let cell = ref 0 in
      Hashtbl.add t k cell;
      cell in
  cell := !cell + 1

let hashget t k = try !(Hashtbl.find t k) with Not_found -> 0

let seen  = ref []

@script:ocaml@
@@

(let file = List.hd (Coccilib.files()) in
thefile := file;
let file =
    try List.hd(List.tl (Str.split (Str.regexp "/linux-next/") file))
    with _ -> file in
let ofile = "/var/julia/linux-next/" ^
      (Filename.chop_extension file) ^ ".o" in
if not(Sys.file_exists ofile)
then Coccilib.exit());

Hashtbl.clear itbl;
Hashtbl.clear ltbl;
seen := []

@r@
identifier f;
@@

__init f(...) { ... }

@script:ocaml@
f << r.f;
@@

Hashtbl.add itbl f ()

@s disable optional_attributes@
identifier f;
@@

static f(...) { ... }

@script:ocaml@
f << s.f;
@@

Hashtbl.add ltbl f ()

@t exists@
identifier f,g;
position p;
@@

__init f(...) { ... when any
   g@p(...)
   ... when any
 }

@script:ocaml@
g << t.g;
_p << t.p;
@@

if not (Hashtbl.mem ltbl g) || Hashtbl.mem itbl g
then Coccilib.include_match false

@ok1 disable optional_attributes exists@
identifier f,t.g;
@@

f(...) { ... when any
   g
   ... when any
 }

@ok2 disable optional_attributes exists@
identifier i,j,fld,t.g;
@@

struct i j = { .fld = g, };

@ok3 disable optional_attributes exists@
identifier t.g;
declarer d;
@@

d(...,g,...);

@ok4 disable optional_attributes exists@
identifier t.g;
expression e;
@@

(
e(...,g,...)
|
e(...,&g,...)
|
e = &g
|
e = g
)

@script:ocaml depends on !ok1 && !ok2 && !ok3 && !ok4@
g << t.g;
@@

let file = !thefile in
let file =
    try List.hd(List.tl (Str.split (Str.regexp "/linux-next/") file))
    with _ -> file in
if not(List.mem (g,file) !seen)
then
  begin
    seen := (g,file) :: !seen;
    let ofile = "/var/julia/linux-next/" ^
      (Filename.chop_extension file) ^ ".o" in
    if Sys.file_exists ofile
    then
      let l =
	Common.cmd_to_list
	  (Printf.sprintf
	     "objdump -x %s | grep -w %s | grep -w F | grep .text.unlikely"
	     ofile g) in
      match l with
	[] -> Coccilib.include_match false
      | _ ->
	  Printf.printf "Info for %s %s\n" file g;
	  List.iter
	    (function l -> Printf.printf "%s\n" l)
	    l;
	  Printf.printf "\n"; flush stdout
    else Coccilib.include_match false
  end
else Coccilib.include_match false

@depends on !ok1 && !ok2 && !ok3 && !ok4@
identifier t.g;
@@

- g
+__init g
 (...) { ... }
