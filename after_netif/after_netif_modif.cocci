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
expression skb, e;
expression E;
@@

- netif_rx(skb);
  ... when != skb = e
(
  E.rx_bytes += skb->len;
  E.rx_packets++;
+ netif_rx(skb);
|
  E.rx_packets++;
  E.rx_bytes += skb->len;
+ netif_rx(skb);
)

@@
expression skb, e;
expression E;
@@

- netif_rx_ni(skb);
  ... when != skb = e
(
  E.rx_bytes += skb->len;
  E.rx_packets++;
+ netif_rx_ni(skb);
|
  E.rx_packets++;
  E.rx_bytes += skb->len;
+ netif_rx_ni(skb);
)

@@
expression skb, e, x;
expression E;
@@

- x = netif_rx(skb);
  ... when != skb = e
      when != x
(
  E.rx_bytes += skb->len;
  E.rx_packets++;
+ netif_rx(skb);
|
  E.rx_packets++;
  E.rx_bytes += skb->len;
+ netif_rx(skb);
)

@@
expression skb, e, x;
expression E;
@@

- x = netif_rx_ni(skb);
  ... when != skb = e
      when != x
(
  E.rx_bytes += skb->len;
  E.rx_packets++;
+ netif_rx_ni(skb);
|
  E.rx_packets++;
  E.rx_bytes += skb->len;
+ netif_rx_ni(skb);
)
