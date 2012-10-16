//
// Description not available
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Author name not available
//

@@ expression E1; identifier I; constant int C; @@
(
set_dma_mode(E1,I,...)
|
*set_dma_mode(E1,C,...)
)

