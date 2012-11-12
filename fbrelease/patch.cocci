//
// eliminate double free
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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
