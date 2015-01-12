//
//  use ERR_CAST
//
// Target: Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

// Target: Linux

@@
expression err,x;
@@

-       err = PTR_ERR(x);
        if (IS_ERR(x))
-                return ERR_PTR(err);
+                return ERR_CAST(x);
