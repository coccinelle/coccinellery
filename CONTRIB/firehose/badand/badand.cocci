//
//  Convert && to ||
//
// Target: Firehose
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

virtual patch
virtual context
virtual firehose

@depends on patch@
expression E;
identifier fld;
@@

- !E && !E->fld
+ !E || !E->fld

@depends on patch@
expression E;
identifier fld;
@@

- E || E->fld
+ E && E->fld

@andrule depends on context || firehose@
expression E;
identifier fld;
position p;
@@

* !E &&@p !E->fld

@orrule depends on context || firehose@
expression E;
identifier fld;
position p;
@@

* E ||@p E->fld

@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on firehose@
p << andrule.p;
@@
analysis.add_result(p, "Convert && to ||", testid="badand", severity="high")

@script:python depends on firehose@
p << orrule.p;
@@
analysis.add_result(p, "Convert && to ||", testid="badand", severity="high")