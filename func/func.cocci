// From linux@rasmusvillemoes.dk Fri Dec  5 16:14:29 2014
// Date: Fri, 05 Dec 2014 16:14:26 +0100
// From: Rasmus Villemoes <linux@rasmusvillemoes.dk>

// sudo apt-get install python-pip
// sudo pip install python-Levenshtein

virtual after_start

@initialize:ocaml@
@@

let extensible_functions = ref ([] : string list)
let restarted = ref false

let restart _ =
  restarted := true;
  let it = new iteration() in
  it#add_virtual_rule After_start;
  Printf.eprintf "restarting\n";
  it#register()

@initialize:python@
@@
import re
from Levenshtein import distance
mindist = 1 // 1 to find only misspellings
maxdist = 2
ignore_leading = True

// ---------------------------------------------------------------------

@r0@
constant char [] c;
identifier f;
@@

f(...,c,...)

@script:ocaml@
c << r0.c;
f << r0.f;
@@

(if not !restarted then restart());
match Str.split_delim (Str.regexp "%") c with
  _::_::_ ->
    if not (List.mem f !extensible_functions)
    then extensible_functions := f :: !extensible_functions
| _ -> ()

// ---------------------------------------------------------------------

@r depends on after_start@
constant char [] c;
position p;
identifier f;
@@

f(...,c@p,...)

@script:python flt@
c << r.c;
p << r.p;
matched;
@@

func = p[0].current_element
wpattern = "[a-zA-Z_][a-zA-Z0-9_]*"
if ignore_leading:
   func = func.strip("_")
   wpattern = "[a-zA-Z][a-zA-Z0-9_]*"
lf = len(func)
cocci.include_match(False)
// ignore extremely short function names
if lf > 3:
   words = [w for w in re.findall(wpattern, c) if abs(len(w) - lf) <= maxdist]
   for w in words:
       d = distance(w, func) 
       if mindist <= d and d <= maxdist:
          coccinelle.matched = w
          cocci.include_match(True)
     	  //print "%s:%d:%s():%d: %s" % (p[0].file, int(p[0].line), func, d, c)
	  break


@script:ocaml r2@
c << r.c;
f << r.f;
matched << flt.matched;
fixed;
@@

let pieces = Str.split_delim (Str.regexp_string matched) c in
match pieces with
  [before;after] ->
    let preceeding =
      List.length(Str.split (Str.regexp_string "%") before) > 1 in
    if preceeding
    then Coccilib.include_match false
    else
      if List.mem f !extensible_functions
      then fixed := before ^ "%s" ^ after
      else Coccilib.include_match false
| _ -> Coccilib.include_match false

@changed1@
constant char [] r.c;
identifier r2.fixed;
position r.p;
identifier r.f;
@@

f(...,
-c@p
+fixed,__func__
 ,...)

// -------------------------------------------------------------------

@s depends on after_start@
constant char [] c;
position p;
identifier f;
@@

f(...,c@p,...)

@script:python flt2@
c << s.c;
p << s.p;
matched;
@@

func = p[0].current_element
wpattern = "[a-zA-Z_][a-zA-Z0-9_]*"
if ignore_leading:
   func = func.strip("_")
   wpattern = "[a-zA-Z][a-zA-Z0-9_]*"
lf = len(func)
cocci.include_match(False)
// ignore extremely short function names
if lf > 3:
   words = [w for w in re.findall(wpattern, c) if abs(len(w) - lf) <= maxdist]
   for w in words:
       d = distance(w, func) 
       if mindist <= d and d <= maxdist:
          coccinelle.matched = w
          cocci.include_match(True)
     	  //print "%s:%d:%s():%d: %s" % (p[0].file, int(p[0].line), func, d, c)
	  break

@script:ocaml s2@
c << s.c;
f << s.f;
p << s.p;
matched << flt2.matched;
fixed;
@@

let ce = (List.hd p).current_element in
let pieces = Str.split_delim (Str.regexp_string matched) c in
match pieces with
  [before;after] ->
    let preceeding =
      List.length(Str.split (Str.regexp_string "%") before) > 1 in
    if preceeding
    then Coccilib.include_match false
    else
      if List.mem f !extensible_functions
      then Coccilib.include_match false
      else fixed := before ^ ce ^ after
| _ -> Coccilib.include_match false

@changed2@
constant char [] s.c;
identifier s2.fixed;
position s.p;
identifier s.f;
@@

f(...,
-c@p
+fixed
 ,...)
