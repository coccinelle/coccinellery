//
//  Exchange pci_iounmaps
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r exists@
expression e,x;
statement S,S1;
int ret;
position p;
@@

e = pci_iomap(x,...)
... when != pci_iounmap(x,e)
if (<+...e...+>) S
... when any
    when != pci_iounmap(x,e)
    when != if (...) { ... pci_iounmap(x,e); ... }
(
 if (ret == 0) S1
|
if (...)
   { ... 
     return 0; }
|
if (...)
   { ... 
     return <+...e...+>; }
|
if@p (...)
   { ... when != pci_iounmap(x,e)
         when forall
     return ...; }
)
... when any
pci_iounmap(x,e);

@ok@
position r.p;
statement S;
identifier l;
@@

(
if@p(...) { ... when != if(...) S
}
|
if@p(...) return ...;
|
if@p(...) goto l;
)

@script:python depends on ok@
p<<r.p;
@@

cocci.print_main("ret",p)
