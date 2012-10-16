//
// removes unnecessary semicolon
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Peter Senna Tschudin <peter.senna@gmail.com>
//

@r_case@
position p;
@@
switch (...)
{
case ...: ...;@p
}

@r_default@
position p;
@@
switch (...)
{
default: ...;@p
}

@r1@
statement S;
position p1;
position p != {r_case.p, r_default.p};
identifier label;
@@
(
label:;
|
S@p1;@p
)

@script:python r2@
p << r1.p;
p_case << r_case.p;
p1 << r1.p1;
@@
if p[0].line != p1[0].line_end:
        cocci.include_match(False)
@@
position r1.p;
@@
-;@p
