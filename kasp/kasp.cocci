@r exists@
local idexpression x;
expression E;
identifier l;
statement S;
@@

*x= \(kasprintf\|kstrdup\)(...);
...
if (x == NULL) S
... when != kfree(x)
    when != E = x
if (...) {
  <... when != kfree(x)
* goto l;
  ...>
* return ...;
}
