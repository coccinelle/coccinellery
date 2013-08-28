//
//  Add missing call to gdth_ioctl_free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression buf,ha,len,addr,E;
@@

buf = gdth_ioctl_alloc(ha, len, FALSE, &addr)
... when != false buf != NULL
    when != true buf == NULL
    when != \(E = buf\|buf = E\)
    when != gdth_ioctl_free(ha, len, buf, addr)
*return ...;
