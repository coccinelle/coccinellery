// arguments: --include-headers --no-includes --no-show-diff

virtual after_start

@initialize:ocaml@
@@

type fl = C of string | H

let structures = Hashtbl.create 101
let restarted = ref false

let add_if_not_present _ =
  if not !restarted
  then
    begin
      restarted := true;
      let it = new iteration() in
      it#add_virtual_rule After_start;
      it#register()
    end

let hashadd str file =
  let cell =
    try Hashtbl.find structures str
    with Not_found ->
      let cell = ref [] in
      Hashtbl.add structures str cell;
      cell in
  if not (List.mem file !cell) then cell := file :: !cell

let get_file fl =
  if Filename.check_suffix fl ".c"
  then C fl
  else H

@script:ocaml depends on !after_start@
@@
add_if_not_present()

@r depends on !after_start@
identifier nm;
position p;
@@

struct nm@p { ... };

@script:ocaml@
nm << r.nm;
p << r.p;
@@

hashadd nm (get_file (List.hd p).file)

// -------------------------------------------------------------------------

@sz depends on after_start@
identifier nm;
position p;
@@

sizeof(struct nm@p *)

@script:ocaml@
nm << sz.nm;
p << sz.p;
@@

try
  let allowed = !(Hashtbl.find structures nm) in
  if List.mem H allowed or List.mem (get_file (List.hd p).file) allowed
  then ()
  else print_main nm p
with Not_found -> print_main nm p
