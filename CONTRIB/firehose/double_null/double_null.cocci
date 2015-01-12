//
//  Correct NULL test
//
// Target: Firehose
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

virtual firehose
virtual context

@r@
expression x;
expression e;
identifier l;
position p2,p3;
@@

if (x@p3 == NULL || ...) {
    ... when forall
    return ...; }
... when != goto l;
    when != x = e
    when != &x
x@p2 == NULL

@single@
position r.p2 != r.p3;
expression x;
@@

x@p2 == NULL

@ok depends on single@
expression x;
position any r.p3;
position r.p2;
@@

... when != x@p3 == NULL
x@p2 == NULL

@final depends on !ok && single && (firehose || context)@
position r.p2,r.p3;
expression x;
@@

*x@p3 == NULL
...
*x@p2 == NULL


@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on firehose && final@
p2 << r.p2;
p3 << r.p3;
@@
file = p3[0].file
line = p3[0].line
col = p3[0].column
colend = p3[0].column_end
oldtest = "previous null test: %s %s %s %s" % (file, line, col, colend)
analysis.add_result(p2, "redundant NULL test", testid="double_null",
	            severity="low", notes=oldtest)
