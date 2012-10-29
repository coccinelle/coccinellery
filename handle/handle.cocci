@@
identifier f,err,l,l1;
type T;
expression x,E;
statement S;
@@

x = NULL
... when != goto l1;
* x = f(...)
... when != x
err = E;
goto l;
...
* if (x != NULL)
  S
return err;
