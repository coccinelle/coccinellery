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
