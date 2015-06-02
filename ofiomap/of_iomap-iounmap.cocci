@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* E = of_iomap(...);
  if (E == NULL) S
  ... when != iounmap(...,(T1)E,...)
      when != if (E != NULL) { ... iounmap(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != iounmap(...,(T2)E,...)
        when != if (E != NULL) { ... iounmap(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }

@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* if ((E = of_iomap(...)) == NULL)
  S
  ... when != iounmap(...,(T1)E,...)
      when != if (E != NULL) { ... iounmap(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != iounmap(...,(T2)E,...)
        when != if (E != NULL) { ... iounmap(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }
