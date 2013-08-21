//
//  Fix use of skb after netif_rx
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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

