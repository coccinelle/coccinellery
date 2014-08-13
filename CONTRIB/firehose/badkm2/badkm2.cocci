//
//  Ensure a consistent return value in error case
//
// Target: Firehose
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

virtual firehose
virtual context

@r exists@
identifier ret;
position p;
constant C;
expression e1,e2,e3,e4;
@@

ret = -C
... when != ret = e1
    when != ret += e1
    when any
if@p (...)
{
  ... when != ret = e2
      when != ret + e2
  return ret;
}
... when any
if (\(ret != 0\|ret < 0\|ret > 0\) || ...)
{
  ...
  return ...;
}
... when != ret = e3
    when != ret += e3
    when any
if@p (...)
{
  ... when != ret = e4
      when != ret += e4
  return ret;
}

@res depends on firehose || context@
identifier r.ret;
position r.p,p2;
statement S;
@@

(
if@p (<+...ret...+>) S
|
*if@p@p2 (...) S
)

@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on firehose@
p2 << res.p2;
@@
analysis.add_result(p2, "Ensure a consistent return value in error case",
	  	    testid="badkm2", severity="high")
