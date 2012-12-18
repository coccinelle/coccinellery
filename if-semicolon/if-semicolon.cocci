//
//  Detect semicolon after if
//
// Target:  Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Peter Senna Tschudin <peter.senna@gmail.com>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r1@
position p;
@@
if (...);@p

@script:python@
p0 << r1.p;
@@
// Emacs org-mode output
cocci.print_main("", p0)
cocci.print_secs("", p0)
