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

