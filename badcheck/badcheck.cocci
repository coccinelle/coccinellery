//
//  fix devm_ioremap_resource error detection code
//
// Target: Linux
// Copyright:  Copyright: 2014 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression e,e1;
statement S;
@@

*e = devm_ioremap_resource(...);
if (!e1) S

