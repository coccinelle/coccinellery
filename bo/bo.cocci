@@
identifier x;
@@

-if (x) BUG();
+BUG_ON(x);

@@
identifier x;
@@

-if (!x) BUG();
+BUG_ON(!x);

