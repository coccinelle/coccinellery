//
//  Drop redundant includes of moduleparam.h
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@ includesmodule @
@@

#include <linux/module.h>

@ depends on includesmodule @
@@

- #include <linux/moduleparam.h>
