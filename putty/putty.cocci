//
// avoid calling put_tty_driver on NULL
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression *x;
@@

*if (x == NULL)
{ ...
* put_tty_driver(x);
  ...
  return ...;
}