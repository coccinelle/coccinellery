//
//  Adjust array index
//
// Target: Firehose
// Copyright:  2012, 2013 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

virtual patch
virtual context
virtual firehose


@r exists@
position p,p1;
expression ar,e1,e2;
@@

for@p(e1 = 0; e1 < e2; e1++) { <... ar@p1[e1] ...> }

@script:python@
p << r.p;
p1 << r.p1;
@@

cocci.include_match(False)

@s depends on patch@
constant c;
expression e1,e2,ar;
position r.p;
@@

for@p(e1 = 0; e1 < e2; e1++) { <...
(
  ar[c]
|
  ar[
- e2
+ e1
  ]
)
  ...> }

@s1 depends on context || firehose exists@
constant c;
expression e1,e2,ar;
position r.p, p1;
@@

for@p(e1 = 0; e1 < e2; e1++) { <...
(
  ar[c]
|
  ar[
* e2@p1
  ]
)
  ...> }

@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on firehose@
p << r.p;
p1 << s1.p1;
@@
file = p[0].file
line = p[0].line
col = p[0].column
colend = p[0].column_end
forinfo = "for loop bound: %s %s %s %s" % (file, line, col, colend)
analysis.add_result(p1, "adjust array index", testid="arref", severity="high",
		    notes=forinfo)