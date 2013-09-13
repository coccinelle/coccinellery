@call@
identifier f;
expression e;
expression list[n] es;
@@

f(es,ARRAY_AND_SIZE(e),...)

@@
expression e;
identifier call.f;
expression list[call.n] ess;
@@

f(ess,
- e,ARRAY_SIZE(e)
+ ARRAY_AND_SIZE(e)
  ,...)
