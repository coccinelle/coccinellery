//
//  Correct the argument to __mesh_table_free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
local idexpression x;
expression E,f;
position p1,p2,p3;
identifier l;
statement S;
@@

x = mesh_table_alloc@p1(...)
...
if (x == NULL) S
... when != E = x
    when != mesh_table_free(x)
goto@p2 l;
... when != E = x
    when != f(...,x,...)
    when any
(
return \(0\|x\);
|
return@p3 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@

print "%s: call on line %s not freed or saved before return on line %s via line %s" % (p1[0].file,p1[0].line,p3[0].line,p2[0].line)

@nr exists@
local idexpression x;
expression E,f;
position p1,p2,p3;
identifier l;
statement S;
@@

x = mesh_table_alloc@p1(...)
...
if (x == NULL) S
... when != E = x
    when != mesh_table_free(x)
    when != goto l;
(
return \(0\|x\);
|
return@p3 ...;
)

@script:python@
p1 << nr.p1;
p3 << nr.p3;
@@

print "%s: call on line %s not freed or saved before return on line %s" % (p1[0].file,p1[0].line,p3[0].line)
