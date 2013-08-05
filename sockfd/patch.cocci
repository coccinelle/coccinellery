@@
expression s;
@@

   s = sockfd_lookup(...)
   ...
+  sockfd_put(s);
?- fput(s->file);
