//
// ensure a consistent return value in error case
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

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