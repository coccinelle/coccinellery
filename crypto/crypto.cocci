@safe@
position p;
expression x;
@@

if (x) { <+... crypto_free_hash@p(x) ...+> }

@@
expression x;
position p!=safe.p;
@@

*x = NULL
...
*crypto_free_hash@p(x)

@@
expression x;
position p!=safe.p;
@@

if (x == NULL || ...) { ...
*crypto_free_hash@p(x)
...
return ...;
}

@@
expression x;
position p!=safe.p;
@@

if (IS_ERR(x) || ...) { ...
*crypto_free_hash@p(x)
...
return ...;
}
