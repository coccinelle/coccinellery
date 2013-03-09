//
//  Kfree etc should not be used with devm functions
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression x,e;
@@

x = devm_kzalloc(...)
... when != x = e
?-kfree(x,...);

@@
expression x,y,e1,e2,e3;
@@

x = devm_kzalloc(...)
... when != x = e1
y = x
... when != x = e2
    when != y = e3
?-kfree(y,...);

@@
expression x,e;
@@

x = \(devm_ioremap\|devm_ioremap_nocache\)(...)
... when != x = e
?-iounmap(x,...);

@@
expression x,y,e1,e2,e3;
@@

x = \(devm_ioremap\|devm_ioremap_nocache\)(...)
... when != x = e1
y = x
... when != x = e2
    when != y = e3
?-iounmap(y,...);

@@
expression x,e;
@@

x = devm_clk_get(...)
... when != x = e
?-clk_put(x,...);

@@
expression x,y,e1,e2,e3;
@@

x = devm_clk_get(...)
... when != x = e1
y = x
... when != x = e2
    when != y = e3
?-clk_put(y,...);

@@
expression x,e;
@@

x = devm_usb_get_phy(...)
... when != x = e
?-usb_put_phy(x,...);

@@
expression x,y,e1,e2,e3;
@@

x = devm_usb_get_phy(...)
... when != x = e1
y = x
... when != x = e2
    when != y = e3
?-usb_put_phy(y,...);

@@
expression x,e;
@@

x = \(devm_pinctrl_get\|devm_pinctrl_get_select_default\)(...)
... when != x = e
?-pinctrl_put(x,...);

@@
expression x,e;
@@

x = devm_regulator_get(...)
... when != x = e
?-regulator_put(x,...);

@@
expression x,y,e1,e2,e3;
@@

x = devm_regulator_get(...)
... when != x = e1
y = x
... when != x = e2
    when != y = e3
?-regulator_put(y,...);

@@
expression d,x,y,e1,e2;
@@

devm_regulator_bulk_get(d,x,y)
... when != x = e1
    when != y = e2
?-regulator_put(x,y);

@@
expression x,e;
@@

 \(devm_gpio_request\|devm_gpio_request_one\)(x,...)
... when != x = e
?-gpio_free(x,...);

@@
expression x,e;
@@

 \(devm_request_irq\|devm_request_threaded_irq\)(x,...)
... when != x = e
?-free_irq(x,...);

@@
expression x,y,e1,e2,e3;
@@

 \(devm_request_irq\|devm_request_threaded_irq\)(x,...)
... when != x = e1
y = x
... when != x = e2
    when != y = e3
?-free_irq(y,...);

@@
expression x,e;
@@

x = dmam_alloc_coherent(...)
... when != x = e
?-\(dma_free_coherent\|dma_free_noncoherent\)(x,...);

@@
expression x,e;
@@

x = dmam_alloc_noncoherent(...)
... when != x = e
?-\(dma_free_coherent\|dma_free_noncoherent\)(x,...);

@@
expression x,y,e1,e2;
@@

devm_request_region(x,y,...)
... when != x = e1
    when != y = e2
(
release_resource(x);
...
-kfree(x);
|
?-release_region(x,y);
)

@@
expression x,e;
@@

x = devm_ioport_map(...)
... when != x = e
?-ioport_unmap(x,...);

@@
expression x,y,e1,e2,e3;
@@

x = devm_ioport_map(...)
... when != x = e1
y = x
... when != x = e2
    when != y = e3
?-ioport_unmap(y,...);
