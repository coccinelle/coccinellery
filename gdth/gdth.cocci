//
// Add missing call to gdth_ioctl_free
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression buf,ha,len,addr,E;
@@

buf = gdth_ioctl_alloc(ha, len, FALSE, &addr)
... when != false buf != NULL
    when != true buf == NULL
    when != \(E = buf\|buf = E\)
    when != gdth_ioctl_free(ha, len, buf, addr)
*return ...;
