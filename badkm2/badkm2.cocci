@r exists@
identifier ret;
position p;
constant C;
expression e1,e2,e3,e4,e;
@@

ret = -C
... when != ret = e1
    when != ret += e1
    when any
if@p (...)
{
  ... when != ret = e2
      when != ret + e2
  return ret;
}
... when any
if (\(ret != 0\|ret < 0\|ret > 0\) || ...)
{
  ...
  return ...;
}
... when != ret = e3
    when != ret += e3
    when any
if@p (...)
{
  ... when != ret = e4
      when != ret += e4
  return ret;
}

@@
identifier r.ret;
position r.p;
statement S;
@@

(
if@p (<+...ret...+>) S
|
*if@p (...) S
)