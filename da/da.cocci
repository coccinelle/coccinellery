//
//  Correct double assignment
//
// Target: Linux, Generic
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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
