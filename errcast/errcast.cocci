//
//  use ERR_CAST
//
// Target: Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
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
