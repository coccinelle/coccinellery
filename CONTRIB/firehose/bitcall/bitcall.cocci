//
// convert & to &&
//
// Target: Firehose
// Copyright: 2012 - LIP6/INRIA
// License: Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/
// URL: http://coccinellery.org/

virtual firehose
virtual context

@r depends on firehose || context@ expression E1, E2; position p; @@
* !E1 &@p !E2

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
analysis.add_result(p, "& where && looks more appropriate", testid="bitcall",
		    severity="moderate")
