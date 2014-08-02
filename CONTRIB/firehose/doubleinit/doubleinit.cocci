//
//  Remove duplicate structure field initialization
//
// Target: Firehose
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

virtual firehose
virtual org

@r@
identifier I, s, fld;
position p0,p;
expression E;
@@

struct I s =@p0 { ..., .fld@p = E, ...};

@s@
identifier I, s, r.fld;
position r.p0,p;
expression E;
@@

struct I s =@p0 { ..., .fld@p = E, ...};

@script:python depends on org@
p0 << r.p0;
fld << r.fld;
ps << s.p;
pr << r.p;
@@

psline = int(ps[0].line)
prline = int(pr[0].line)
pscol = int(ps[0].column)
prcol = int(pr[0].column)
if psline < prline or (psline == prline and pscol < prcol):
  cocci.print_main(fld,p0)
  cocci.print_secs("s",ps)
  cocci.print_secs("r",pr)


@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on firehose@
p0 << r.p0;
fld << r.fld;
ps << s.p;
pr << r.p;
@@

file = ps[0].file
psline = int(ps[0].line)
prline = int(pr[0].line)
pscol = int(ps[0].column)
prcol = int(pr[0].column)
pscolend = int(ps[0].column_end)
if psline < prline or (psline == prline and pscol < prcol):
  previnfo = "previous reference: %s %d %d %d" % (file,psline,pscol,pscolend)
  analysis.add_result(pr, "duplicate structure field initialization",
		      testid="doubleinit", severity="moderate",
		      notes=previnfo)
