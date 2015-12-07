//
//  Avoid using magic number in set_dma_mode
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@ expression E1; identifier I; constant int C; @@
(
set_dma_mode(E1,I,...)
|
*set_dma_mode(E1,C,...)
)

