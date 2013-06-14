//
//  Use devm_ functions
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@ok@
expression dev;
@@
 devm_request_mem_region(dev, ...)
 ...
 \(devm_ioremap\|devm_ioremap_nocache\)(dev,...)

@depends on ok@
expression res,y,dev,size,name;
@@

y = res->start;
...
devm_request_mem_region(dev, 
-y
+ res->start
, size, name)

@depends on ok@
expression res,y,dev,size,name;
@@

y = res.start;
...
devm_request_mem_region(dev, 
-y
+ res.start
, size, name)

@depends on ok@
expression res,y,dev,size;
@@

y = res->start;
...
 \(devm_ioremap\|devm_ioremap_nocache\)(dev, 
-y
+ res->start
, size)

@depends on ok@
expression res,y,dev,size;
@@

y = res.start;
...
 \(devm_ioremap\|devm_ioremap_nocache\)(dev, 
-y
+ res.start
, size)

@depends on ok@
expression res,y,dev,name,starter;
@@

y = resource_size(res);
...
devm_request_mem_region(dev, starter,
-y
+ resource_size(res)
, name)

@depends on ok@
expression res,y,dev,starter;
@@

y = resource_size(res);
...
 \(devm_ioremap\|devm_ioremap_nocache\)(dev, starter,
-y
+ resource_size(res)
 )

// --------------------------------------------------------------------

@@
expression dev,res,size,name;
statement S;
@@

-if ((devm_request_mem_region(dev, res->start, size, name)) == NULL) S
...
- \(devm_ioremap\|devm_ioremap_nocache\)(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
... when any

@@
expression dev,res,size,name;
statement S;
@@

-if ((devm_request_mem_region(dev, res.start, size, name)) == NULL) S
...
- \(devm_ioremap\|devm_ioremap_nocache\)(dev,res.start,size)
+devm_request_and_ioremap(dev,&res)
... when any

@@
expression dev,res,size,name;
statement S;
@@

- res = devm_request_mem_region(dev, res->start, size, name);
 ... when != res
-if (res == NULL) S
...
- \(devm_ioremap\|devm_ioremap_nocache\)(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
... when any

@@
expression dev,res,size,x,name;
statement S;
@@

-x = devm_request_mem_region(dev, res->start, size, name);
 ... when != x
-if (x==NULL) S
... when != x
- \(devm_ioremap\|devm_ioremap_nocache\)(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
... when any
    when != x

@@
expression dev,res,size,x,name;
statement S;
@@

-x = devm_request_mem_region(dev, res.start, size, name);
 ... when != x
-if (x==NULL) S
... when != x
- \(devm_ioremap\|devm_ioremap_nocache\)(dev,res.start,size)
+devm_request_and_ioremap(dev,&res)
... when any
    when != x

//-------------------------------------------------------------------------
// cleanup

@@
identifier x;
@@

- struct resource *x = ...;
... when != x
    when strict

@@
expression dev,res;
statement S;
@@

-if (res == NULL) S
... when != res
devm_request_and_ioremap(dev,res)
