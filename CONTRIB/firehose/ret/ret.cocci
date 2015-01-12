//
//  Useless goto and return
//
// Target: Firehose
// Copyright:  2012, 2013 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 
//Options: -no_includes -include_headers

virtual firehose

@r@
expression ret;
identifier f,l;
statement S;
position p;
@@

(
if (<+...f(...)...+>) S
|
if@p (...) return ret;
return ret;
|
if@p (...) goto l;
l:
return ret;
)

@script:python depends on !firehose@
p << r.p;
@@

// Emacs org-mode output
cocci.print_main("useless goto and return", p)

@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on firehose@
p << r.p;
@@
analysis.add_result(p, "useless goto and return", testid="ret", severity="low")
