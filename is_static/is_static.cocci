//
//  Make some structures static
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
identifier f;
identifier I;
position p;
identifier x;
@@

f(...) { <... struct I@p x; ...> }

@ty disable optional_storage@
identifier I,nm;
position p!=r.p;
@@

struct I@p nm;

@e@
declarer name EXPORT_SYMBOL;
declarer name EXPORT_SYMBOL_GPL;
declarer name EXPORT_SYMBOL_GPL_FUTURE;
declarer name EXPORT_UNUSED_SYMBOL;
declarer name EXPORT_UNUSED_SYMBOL_GPL;
identifier ty.nm;
@@

(
EXPORT_SYMBOL(nm);
|
EXPORT_SYMBOL_GPL(nm);
|
EXPORT_SYMBOL_GPL_FUTURE(nm);
|
EXPORT_UNUSED_SYMBOL(nm);
|
EXPORT_UNUSED_SYMBOL_GPL(nm);
)

@script:python depends on !e@
nm << ty.nm;
p << ty.p;
@@

import subprocess
if (subprocess.call("./is_static "+nm.ident+" "+p[0].file, shell=True)) != 0:
	cocci.include_match(False)

@depends on !e@
identifier I,ty.nm;
position ty.p;
@@

+static
struct I@p nm;
