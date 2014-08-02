//
//  Detect semicolon after if
//
// Target: Firehose
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Peter Senna Tschudin <peter.senna@gmail.com>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

virtual firehose

@r1@
position p1,p2;
expression e;
@@
if (e)@p1;@p2

@script:python depends on !firehose@
p1 << r1.p1;
p2 << r1.p2;
@@

// Emacs org-mode output

if (int(p1[0].line) == int(p2[0].line) and int(p1[0].column_end) == int(p2[0].column)):
  cocci.print_main("semicolon after if", p1)

@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on firehose@
p1 << r1.p1;
p2 << r1.p2;
@@
if (int(p1[0].line) == int(p2[0].line) and int(p1[0].column_end) == int(p2[0].column)):
  analysis.add_result(p1, "semicolon after if", testid="if-semicolon",
		      severity="high")
