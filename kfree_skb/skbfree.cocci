//
// Convert kfree to kfree_skb
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
struct sk_buff *skb;
@@

- kfree(skb)
+ kfree_skb(skb)
