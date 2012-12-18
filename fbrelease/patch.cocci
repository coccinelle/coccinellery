//
//  eliminate double free
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
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
