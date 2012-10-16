@@
identifier ret,l;
expression e1,e2,e3;
statement S;
@@

if (ret < 0)
 { ... return ret; }
... when != ret = e1
    when forall
(
 goto l;
|
 return ...;
|
 if (<+... ret = e3 ...+>) S
|
*if(...)
 {
  ... when != ret = e2
* return ret;
}
)
