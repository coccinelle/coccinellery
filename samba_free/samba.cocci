//
//  Add missing calls to talloc_free
//
// Target:  Samba
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
local idexpression e;
identifier f;
position p2;
@@

f(...) { <... if (...) { ... talloc_free@p2(e); ... return ...; } ...> }

@bad@
position p;
local idexpression r.e;
expression f;
@@

f(...,&e,...)
... when != e
if (...) { ... return@p ...; ...}

@s exists@
local idexpression r.e;
expression e1,e2;
position p1!=bad.p,r.p2;
statement S;
@@

(
if (e == NULL || ...) S
|
if (<+...e = e2...+>) S
|
if (...) { ... when != talloc_free(e);
(
  return <+...e...+>;
|
  return@p1 ...;
)
 }
)
... when != e = e1
    when != &e
    when any
talloc_free@p2(e);

@script:python@
p1 << s.p1;
p2 << r.p2;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)
