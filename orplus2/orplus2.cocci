@r@
constant c;
identifier i;
expression e;
@@

(
e | c@i
|
e & c@i
|
e |= c@i
|
e &= c@i
)

@@
constant r.c,c1;
identifier i1;
@@

*c1@i1 + c
