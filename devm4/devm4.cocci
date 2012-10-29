@r@
expression x;
@@

(
 x = devm_kzalloc(...)
|
 x = devm_request_irq(...)
|
 x = devm_ioremap(...)
|
 x = devm_ioremap_nocache(...)
)

@@
expression r.x;
@@

(
* kfree(x)
|
* free_irq(x)
|
* iounmap(x)
)