//
//  Initialize all fields
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@a disable decl_init@
identifier x,x1;
type T,T1;
expression e,sz;
@@

T x;
... when any
copy_to_user(e,&x,sz)

@r@
a.T y;
identifier f,f1,f2;
@@

(
y.f1[...]
|
y.f1.f2
|
y.f
)

@b@
identifier a.x,r.f;
type a.T;
expression e,e1,sz;
position p,p0;
@@

T x@p0;
... when != x.f = e1
    when != &x
    when != &(x.f)
    when != get_user(x.f,...)
    when != __get_user(x.f,...)
    when != x = e1
copy_to_user@p(e,&x,sz)

@script:ocaml@
t << a.T;
x << a.x;
f << r.f;
p << b.p;
@@

Printf.printf "%s:%d: %s %s missing %s\n" (List.hd p).file (List.hd p).line
   t x f
