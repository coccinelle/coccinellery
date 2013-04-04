// Copyright: (C) 2009 Gilles Muller, Julia Lawall, INRIA, DIKU.  GPLv2.

@@
struct resource *res;
@@

- (res->end - res->start) + 1
+ resource_size(res)

@@
struct resource *res;
@@

- res->end - res->start
+ BAD(resource_size(res))
