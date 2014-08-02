//
//  Drop unnecessary continue
//
// Target: Firehose
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

virtual firehose
virtual patch
virtual context

@depends on patch@
statement S;
@@

while (...) {
  ...
  if (...)
  {
+   DROP_ME();
    S
-   continue;
  }
}

@depends on patch@
statement S;
@@

for (...;...;...) {
  ...
  if (...)
  {
+   DROP_ME();
    S
-   continue;
  }
}

@depends on patch@
statement S;
@@
  if (...)
- {
-   DROP_ME();
    S
- }

@depends on patch@
@@

while (...) {
  ...
  if (...) {
    ...
-   continue;
  }
}

@depends on patch@
@@

for (...;...;...) {
  ...
  if (...) {
    ...
-   continue;
  }
}


// firehose

@bc1 depends on (firehose || context)@
position p;
@@

while (...) {
  ...
  if (...) {
    ...
*   continue;@p
  }
}

@bc2 depends on (firehose || context)@
position p;
@@

for (...;...;...) {
  ...
  if (...) {
    ...
*   continue;@p
  }
}

@initialize:python depends on firehose@
@@
coccilib.xml_firehose.import_firehose()
analysis = coccilib.xml_firehose.Analysis(use_env_variables=True)

@finalize:python depends on firehose@
@@
analysis.print_analysis()

@script:python depends on firehose@
p << bc1.p;
@@
analysis.add_result(p, "unnecessary continue", testid="drop_continue",
	            severity="low")

@script:python depends on firehose@
p << bc2.p;
@@
analysis.add_result(p, "unnecessary continue", testid="drop_continue",
	            severity="low")
