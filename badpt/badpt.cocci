@@
expression x,y;
@@

if (IS_ERR(x) || ...) {
  ... when any
      when != IS_ERR(...)
(
   PTR_ERR(x)
|
*  PTR_ERR(y)
)
  ... when any
}