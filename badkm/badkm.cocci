@@
identifier ret,f;
expression E,E1,x;
@@

(
ret = f(...);
if (ret != 0) { ... when forall
  return ...; }
|
ret = 0
)
... when != ret = E
    when any
x = \(kmalloc\|kzalloc\|kcalloc\)(...);
*if(x == NULL) {
 ... when != ret = E1
* return ret;
}
