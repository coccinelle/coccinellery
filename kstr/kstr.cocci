//
//  Use kstrtoul, etc
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression a,b;
{int,long} *c;
@@

-strict_strtol
+kstrtol
 (a,b,c)

@@
expression a,b;
long long *c;
@@

-strict_strtoll
+kstrtoll
 (a,b,c)

@@
typedef ulong;
expression a,b;
{ulong,unsigned long,unsigned int,size_t} *c;
@@

-strict_strtoul
+kstrtoul
 (a,b,c)

@@
expression a,b;
unsigned long long *c;
@@

-strict_strtoull
+kstrtoull
 (a,b,c)

@@
expression a,b;
u64 *c;
@@

-strict_strtoull
+kstrtou64
 (a,b,c)

@@
@@

(
+BAD(
  strict_strtoull(...)
+)
|
+BAD(
  strict_strtoul(...)
+)
|
+BAD(
  strict_strtol(...)
+)
|
+BAD(
  strict_strtoll(...)
+)
)
