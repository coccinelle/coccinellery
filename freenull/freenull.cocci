
@@
expression ptr;
@@

- if (ptr != NULL)
  kfree(ptr);

@@
expression ptr;
@@

- if (ptr != NULL) {
  kfree(ptr);
  ptr = NULL;
- }
