/// Find &&/|| operations that include the same argument more than once
//# This is a variant of doubletest that ignores function calls, ++, etc
///
// Confidence: High
// Copyright: (C) 2012 Nicolas Palix, DIKU.  GPLv2.
// Copyright: (C) 2012 Julia Lawall, DIKU.  GPLv2.
// Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.  GPLv2.
// URL: http://coccinelle.lip6.fr/
// Comments:
// Options: -no_includes -include_headers

virtual context
virtual org
virtual report

@a@
position p;
statement S1,S2;
expression list es;
expression E;
@@

if@p (<+...\(E(es)\|E++\|E--\|++E\|--E\)...+>) S1 else S2

@r@
expression E;
position p1!=a.p,p;
statement S1,S2;
@@

if@p1(<+...
(
* E@p
  || ... || E
|
* E@p
  && ... && E
)
...+>) S1 else S2

@script:python depends on org@
p << r.p;
@@

cocci.print_main("duplicated argument to && or ||",p)

@script:python depends on report@
p << r.p;
@@

coccilib.report.print_report(p[0],"duplicated argument to && or ||")
