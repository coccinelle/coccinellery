//
// delete double assignment
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression e1,e2,e3;
@@

(
 (<+...e1++...+>)=e2;
|
 (<+...e1--...+>)=e2;
|
 (<+...++e1...+>)=e2;
|
 (<+...--e1...+>)=e2;
|
e1=e2;
e1 = <+...e1...+>;
|
*e1=e2;
*e1=e3;
)