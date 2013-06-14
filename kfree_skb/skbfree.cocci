//
//  Convert kfree/kfree_skb to dev_kfree_skb_irq
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
struct sk_buff *skb;
@@

- kfree(skb)
+ kfree_skb(skb)
