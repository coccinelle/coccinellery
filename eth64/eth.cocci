//
//  use ether_addr_equal_64bits
//
// Target: Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// Target: Linux

@pre@
expression *e;
position p;
@@

ether_addr_equal@p(...,e,...)

@r@
identifier T;
struct T eth;
identifier fld;
identifier T1;
struct T1 eth1;
identifier fld1;
position p!=pre.p;
@@

ether_addr_equal@p(eth.fld, eth1.fld1)

@ok@
identifier r.T;
type t1, t2;
identifier r.fld, fld2;
position p;
@@

struct T@p { ...
    t1 fld[...];
    t2 fld2;
    ...
  };

@ok1@
identifier r.T1;
type t1, t2;
identifier r.fld1, fld2;
position p1;
@@

struct T1@p1 { ...
    t1 fld1[...];
    t2 fld2;
    ...
  };

@script:ocaml@
rp << r.p;
okp << ok.p;
okp1 << ok1.p1;
t << r.T;
t1 << r.T1;
@@

let rp = List.hd rp in
let okp = List.hd okp in
let okp1 = List.hd okp1 in
Printf.printf "## %s: struct %s defined in %s\n" rp.file t okp.file;
Printf.printf "## %s: struct %s defined in %s\n" rp.file t1 okp1.file;
flush stdout

@depends on ok && ok1@
position r.p;
@@

-ether_addr_equal@p
+ether_addr_equal_64bits
  (...)