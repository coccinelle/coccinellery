@@
expression x;
statement S;
@@

x = knav_queue_open(...);
if (
-   IS_ERR_OR_NULL
+   IS_ERR
    (x)) S