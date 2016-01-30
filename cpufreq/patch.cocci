//
//  Add calls to cpufreq_cpu_put
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
type T;
identifier E;
expression E1, E2;
int ret;
statement S;
@@

  T E;
  ... when any
(
  E = cpufreq_cpu_get(...);
  if (E == NULL) S
|
  if ((E = cpufreq_cpu_get(...)) == NULL) S
)
  ... when != E2 = E
      when strict
(
  cpufreq_cpu_put(E);
|
  E1 = E;
|
+ cpufreq_cpu_put(E);
  return;
|
+ cpufreq_cpu_put(E);
  return ret;
)
