//
// Fix use of skb after netif_rx
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
expression skb, e,e1;
@@

(
 netif_rx(skb);
|
 netif_rx_ni(skb);
)
  ... when != skb = e
(
  skb = e1
|
* skb
)

@@
expression skb, e,e1, x;
@@

(
 x = netif_rx(skb)
|
 x = netif_rx_ni(skb)
)
  ... when != skb = e
      when != x
(
  skb = e1
|
* skb
)

