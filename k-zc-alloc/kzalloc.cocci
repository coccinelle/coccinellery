// kzalloc should be used rather than kmalloc followed by memset 0
// kcalloc should be used rather than kzalloc of a product of values
//
// Confidence: High
// Copyright: (C) Gilles Muller, Julia Lawall, EMN, DIKU.  GPLv2.
// URL: http://www.emn.fr/x-info/coccinelle/rules/kzalloc.html
// Options:

@@
type T, T2;
expression x;
identifier f,f1;
expression E1,E2,E3,E4;
statement S,S1,S2;
@@

- x = (T)kmalloc(E1,E2)
+ x = kzalloc(E1,E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
  if ((x!=NULL)&&...) {
    ... when != \(f1(...,x,...)\|<+...x...+>=E4\)
        when != \(while(...) S1\|for(...;...;...) S1\)
-   memset((T2)x,0,E1);
    ...
  } else S2
|
- memset((T2)x,0,E1);
)

@@
type T, T2;
type T1;
T1 *x;
T1 *y;
identifier f,f1;
expression E2,E3,E4;
statement S,S1,S2;
@@

- x = (T)kmalloc(sizeof(T1),E2)
+ x = kzalloc(sizeof(T1),E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
  if ((x!=NULL)&&...) {
    ... when != \(f1(...,x,...)\|<+...x...+>=E4\)
        when != \(while(...) S1\|for(...;...;...) S1\)
-   memset((T2)x,0,sizeof(*y));
    ...
  } else S2
|
- memset((T2)x,0,sizeof(*y));
)

@@
type T, T2;
type T1;
T1 *x;
T1 *y;
identifier f,f1;
expression E,E2,E3,E4;
statement S,S1,S2;
@@

- x = (T)kmalloc(sizeof(T1)*E,E2)
+ x = kzalloc(sizeof(T1)*E,E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
  if ((x!=NULL)&&...) {
    ... when != \(f1(...,x,...)\|<+...x...+>=E4\)
        when != \(while(...) S1\|for(...;...;...) S1\)
-   memset((T2)x,0,sizeof(*y)*E);
    ...
  } else S2
|
- memset((T2)x,0,sizeof(*y)*E);
)

@@
type T, T2;
type T1;
T1 *x;
T1 *y;
identifier f,f1;
expression E2,E3,E4;
statement S,S1,S2;
@@

- x = (T)kmalloc(sizeof(*y),E2)
+ x = kzalloc(sizeof(*y),E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
  if ((x!=NULL)&&...) {
    ... when != \(f1(...,x,...)\|<+...x...+>=E4\)
        when != \(while(...) S1\|for(...;...;...) S1\)
-   memset((T2)x,0,sizeof(T1));
    ...
  } else S2
|
- memset((T2)x,0,sizeof(T1));
)

@@
type T, T2;
type T1;
T1 *x;
T1 *y;
identifier f,f1;
expression E,E2,E3,E4;
statement S,S1,S2;
@@

- x = (T)kmalloc(sizeof(*y)*E,E2)
+ x = kzalloc(sizeof(*y)*E,E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
  if ((x!=NULL)&&...) {
    ... when != \(f1(...,x,...)\|<+...x...+>=E4\)
        when != \(while(...) S1\|for(...;...;...) S1\)
-   memset((T2)x,0,sizeof(T1)*E);
    ...
  } else S2
|
- memset((T2)x,0,sizeof(T1)*E);
)

@ disable neg_if, mult_comm @
type T, T2;
expression x;
identifier f,f1;
expression E0,E1,E2,E3,E4;
statement S,S1,S2;
@@

- x = (T)kmalloc(E0 * E1,E2)
+ x = kzalloc(E0 * E1,E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
  if ((x!=NULL)&&...) {
    ... when != \(f1(...,x,...)\|<+...x...+>=E4\)
        when != \(while(...) S1\|for(...;...;...) S1\)
-   memset((T2)x,0,E1 * E0);
    ...
  } else S2
|
- memset((T2)x,0,E1 * E0);
)

// ---------------------------------------------------------------------
// ---------------------------------------------------------------------

// have to duplicate everything again to make a version with no braces

//\(x->fld\|f(...,x,...)\|x=E\)

@@
type T, T2;
expression x;
identifier f;
expression E1,E2,E3;
statement S,S2;
@@

- x = (T)kmalloc(E1,E2)
+ x = kzalloc(E1,E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
- if ((x!=NULL)&&...) memset((T2)x,0,E1);
|
+ if (!x)
- if ((x!=NULL)&&...) memset((T2)x,0,E1); else
  S2
)

@ @
type T, T2;
type T1;
T1 *x;
T1 *y;
identifier f;
expression E2,E3;
statement S,S2;
@@

- x = (T)kmalloc(sizeof(T1),E2)
+ x = kzalloc(sizeof(T1),E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
- if ((x!=NULL)&&...) memset((T2)x,0,sizeof(*y));
|
+ if (!x)
- if ((x!=NULL)&&...) memset((T2)x,0,sizeof(*y)); else
  S2
)

@@
type T, T2;
type T1;
T1 *x;
T1 *y;
identifier f;
expression E,E2,E3;
statement S,S2;
@@

- x = (T)kmalloc(sizeof(T1)*E,E2)
+ x = kzalloc(sizeof(T1)*E,E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
- if ((x!=NULL)&&...) memset((T2)x,0,sizeof(*y)*E);
|
+ if (!x)
- if ((x!=NULL)&&...) memset((T2)x,0,sizeof(*y)*E); else
  S2
)

@@
type T, T2;
type T1;
T1 *x;
T1 *y;
identifier f;
expression E2,E3;
statement S,S2;
@@

- x = (T)kmalloc(sizeof(*y),E2)
+ x = kzalloc(sizeof(*y),E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
- if ((x!=NULL)&&...) memset((T2)x,0,sizeof(T1));
|
+ if (!x)
- if ((x!=NULL)&&...) memset((T2)x,0,sizeof(T1)); else
  S2
)

@@
type T, T2;
type T1;
T1 *x;
T1 *y;
identifier f;
expression E,E2,E3;
statement S,S2;
@@

- x = (T)kmalloc(sizeof(*y)*E,E2)
+ x = kzalloc(sizeof(*y)*E,E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
- if ((x!=NULL)&&...) memset((T2)x,0,sizeof(T1)*E);
|
+ if (!x)
- if ((x!=NULL)&&...) memset((T2)x,0,sizeof(T1)*E); else
  S2
)

@ disable neg_if, mult_comm @
type T, T2;
expression x;
identifier f;
expression E0,E1,E2,E3;
statement S,S2;
@@

- x = (T)kmalloc(E0 * E1,E2)
+ x = kzalloc(E0 * E1,E2)
  ...  when != \(f(...,x,...)\|<+...x...+>=E3\)
       when != \(while(...) S\|for(...;...;...) S\)
(
- if ((x!=NULL)&&...) memset((T2)x,0,E1 * E0);
|
+ if (!x)
- if ((x!=NULL)&&...) memset((T2)x,0,E1 * E0); else
  S2
)

// ---------------------------------------------------------------------

@@
expression E;
statement S;
@@

  kzalloc(...)
  ...
  if (E) S
- else { }

// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
@@
expression E1,E2,E3;
@@

- kzalloc(E1*sizeof(E2),E3)
+ kcalloc(E1,sizeof(E2),E3)

@@
expression E1,E3;
type T;
@@

- kzalloc(E1*sizeof(T),E3)
+ kcalloc(E1,sizeof(T),E3)

@@
expression E1,E2,E3,E4;
@@

- kzalloc(E1*E2*sizeof(E3),E4)
+ kcalloc(E1*E2,sizeof(E3),E4)

@@
expression E1,E2,E3;
type T;
@@

- kzalloc(E1*E2*sizeof(T),E3)
+ kcalloc(E1*E2,sizeof(T),E3)

@@
expression E1,E2,E3,E4;
@@

- kzalloc(sizeof(E3)*E1*E2,E4)
+ kcalloc(E1*E2,sizeof(E3),E4)

@@
expression E1,E2,E3;
type T;
@@

- kzalloc(sizeof(T)*E1*E2,E3)
+ kcalloc(E1*E2,sizeof(T),E3)

@@
constant E1;
expression E2,E3;
@@

- kzalloc(E1*E2,E3)
+ kcalloc(E1,E2,E3)
