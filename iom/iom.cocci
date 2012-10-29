@@
expression e;
statement S,S1;
int ret;
@@

e = \(ioremap\|ioremap_nocache\)(...)
... when != iounmap(e)
if (<+...e...+>) S
... when any
    when != iounmap(e)
    when != if (...) { ... iounmap(e); ... }
(
 if (ret == 0) S1
|
*if (...)
   { ... when != iounmap(e)
         when != if (...) { ... iounmap(e); ... }
     return ...; }
)
... when any
iounmap(e);
