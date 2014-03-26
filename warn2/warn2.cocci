@@
expression e;
@@

(
if(<+...e(...)...+>) WARN_ON(1);
|
- if (e) WARN_ON(1);
+ WARN_ON(e);
)

@@
expression e;
@@

(
if(<+...e(...)...+>) WARN_ON_ONCE(1);
|
- if (e) WARN_ON_ONCE(1);
+ WARN_ON_ONCE(e);
)