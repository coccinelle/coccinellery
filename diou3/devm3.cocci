@exists@
@@

if (...) {
 ... when any
(
- devm_kfree(...);
|
- devm_free_irq(...);
|
- devm_iounmap(...);
|
- devm_release_region(...);
|
- devm_release_mem_region(...);
)
 ... when any
 return ...;
}

@@
identifier f;
@@

f(...) { ... when any
(
- devm_kfree(...);
|
- devm_free_irq(...);
|
- devm_iounmap(...);
|
- devm_release_region(...);
|
- devm_release_mem_region(...);
)
 ... when any
 return 0;
}

