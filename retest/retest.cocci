//
//  Adjust duplicate test
//
// Target: Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
expression e1,e2;
identifier f,g;
position p1,p2;
@@

if@p1 ( \(e1->f == NULL\|IS_ERR(e1->f)\) ) { ... when forall
   return ...; }
... when != \(e1->f = e2\|e1->f += e2\|e1->f -= e2\|e1->f |= e2\|e1->f &= e2\|e1->f++\|e1->f--\|g(...,e1,...)\)
if@p2 ( \(e1->f == NULL\|IS_ERR(e1->f)\) ) { ... when forall
   return ...; }

@rsame exists@
expression e;
position r.p1,r.p2;
statement S1,S2;
@@

if@p1 ( e ) S1
... when any
if@p2 ( e ) S2

@rok depends on rsame exists@
expression e1,e2;
identifier f;
position r.p1,r.p2;
statement S1,S2;
@@

if@p1 ( \(e1->f == NULL\|IS_ERR(e1->f)\) ) S1
... when any
 \(e1->f = e2\|e1->f += e2\|e1->f -= e2\|e1->f |= e2\|e1->f &= e2\|e1->f++\|e1->f--\|g(...,e1,...)\)
... when any
if@p2 ( ... ) S2

@rother depends on rsame exists@
position r.p1,r.p2;
statement S;
@@

... when != if@p1 (...) S
if@p2 ( ... ) { ... return ...; }

@script:python depends on rsame && !rok && !rother@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].line != p2[0].line):
  cocci.print_main("",p1)
  cocci.print_secs("",p2)

@s exists@
local idexpression y;
expression e;
position p1,p2;
@@


if@p1 ( \(y == NULL\|IS_ERR(y)\|y != 0\) ) { ... when forall
   return ...; }
... when != \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\|XT_GETPAGE(...,y)\|WMI_CMD_BUF(...)\)
if@p2 ( \(y == NULL\|IS_ERR(y)\|y != 0\) ) { ... when forall
   return ...; }

@ssame exists@
expression e;
position s.p1,s.p2;
statement S1,S2;
@@

if@p1 ( e ) S1
... when any
if@p2 ( e ) S2

@sok depends on ssame exists@
local idexpression y;
expression e;
position s.p1,s.p2;
statement S1,S2;
@@

if@p1 ( \(y == NULL\|IS_ERR(y)\|y != 0\) ) S1
... when any
 \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\|XT_GETPAGE(...,y)\|WMI_CMD_BUF(...)\)
... when any
if@p2 ( ... ) S2

@sother depends on ssame exists@
position s.p1,s.p2;
statement S;
@@

... when != if@p1 (...) S
if@p2 ( ... ) { ... return ...; }

@script:python depends on ssame && !sok && !sother@
p1 << s.p1;
p2 << s.p2;
@@

if (p1[0].line != p2[0].line):
  cocci.print_main("",p1)
  cocci.print_secs("",p2)
