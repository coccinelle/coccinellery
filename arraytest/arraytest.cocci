@r@
type T;
T [] e;
position p;
@@

(
 e ==@p NULL
|
 e !=@p NULL
|
 !@p e
)

@ disable fld_to_ptr@
expression e;
identifier f;
position r.p;
@@

(
* (e.f) ==@p NULL
|
* (e.f) !=@p NULL
|
* !@p(e.f)
)
