@@
expression buf,ha,len,addr,E;
@@

buf = gdth_ioctl_alloc(ha, len, FALSE, &addr)
... when != false buf != NULL
    when != true buf == NULL
    when != \(E = buf\|buf = E\)
    when != gdth_ioctl_free(ha, len, buf, addr)
*return ...;
