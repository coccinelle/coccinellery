//
//  Correct double assignment
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
expression i,f;
position p1,p2;
@@

(
 (<+...i++...+>) = ...;
|
 (<+...++i...+>) = ...;
|
 (<+...i--...+>) = ...;
|
 (<+...--i...+>) = ...;
|
 i = <+...f(...)...+>;
|
 i@p1 = ...;
(
 i = <+...i...+>;
|
 i = <+...f(...)...+>;
|
 i@p2 = ...;
)
)

@s@
expression i;
position r.p1,r.p2;
@@

 i@p1 = ...;
*i@p2 = ...;


@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on s && firehose@
p2 << r.p2;
@@
analysis.add_result(p2, "second consecutive assignment to the same variable",
		    testid="da", severity="high")