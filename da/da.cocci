//
// correct double assignment
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
expression i,f;
position p1,p2;
@@

(
 (<+...i++...+>) = ...;
|
 (<+...++i...+>) = ...;
|
 (<+...i--...+>) = ...;
|
 (<+...--i...+>) = ...;
|
 i = <+...f(...)...+>;
|
 i@p1 = ...;
(
 i = <+...i...+>;
|
 i = <+...f(...)...+>;
|
 i@p2 = ...;
)
)

@@
expression i;
position r.p1,r.p2;
@@

 i@p1 = ...;
*i@p2 = ...;
