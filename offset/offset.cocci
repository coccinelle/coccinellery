@r@
type T;
T s;
type T1, T2;
identifier fld1, fld2;
typedef uint8_t;
typedef u8;
@@

(
  (char *)&s.fld1 - (char *)&s.fld2
|
  (uint8_t *)&s.fld1 - (uint8_t *)&s.fld2
|
  (u8 *)&s.fld1 - (u8 *)&s.fld2
|
- (T1)&s.fld1 - (T2)&s.fld2
+ offsetof(T,fld1) - offsetof(T,fld2)
)

@r1 disable ptr_to_array@
type T;
T *s;
type T1, T2;
identifier fld1, fld2;
@@

(
  (char *)&s->fld1 - (char *)&s->fld2
|
  (uint8_t *)&s->fld1 - (uint8_t *)&s->fld2
|
  (u8 *)&s->fld1 - (u8 *)&s->fld2
|
- (T1)&s->fld1 - (T2)&s->fld2
+ offsetof(T,fld1) - offsetof(T,fld2)
)

@r2@
type T;
T s;
type T1, T2;
identifier fld1;
@@

(
  (char *)&s.fld1 - (char *)&s
|
  (uint8_t *)&s.fld1 - (uint8_t *)&s
|
  (u8 *)&s.fld1 - (u8 *)&s
|
- (T1)&s.fld1 - (T2)&s
+ offsetof(T,fld1)
)

@r3 disable ptr_to_array@
type T;
T *s;
type T1, T2;
identifier fld1;
@@

(
  (char *)&s->fld1 - (char *)s
|
  (uint8_t *)&s->fld1 - (uint8_t *)s
|
  (u8 *)&s->fld1 - (u8 *)s
|
- (T1)&s->fld1 - (T2)s
+ offsetof(T,fld1)
)

@@
type T;
expression E;
@@

- (int)(offsetof(T,E))
+ offsetof(T,E)
