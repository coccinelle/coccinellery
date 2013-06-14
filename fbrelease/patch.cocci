//
//  eliminate double free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression E;
@@

* kfree(E);
...
* framebuffer_release(E);

@@
expression E;
@@

* framebuffer_release(E);
...
* kfree(E);
