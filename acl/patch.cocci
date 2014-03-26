@@
type T;
identifier E;
expression E1, E2;
int ret;
statement S;
@@

  T E;
  <+...
(
  E = \(posix_acl_clone\|posix_acl_alloc\|posix_acl_dup\)(...);
  if (E == NULL) S
|
  if ((E = \(posix_acl_clone\|posix_acl_alloc\|posix_acl_dup\)(...)) == NULL) S
)
  ... when != E2 = E
      when strict
(
  posix_acl_release(E);
|
  E1 = E;
|
+ posix_acl_release(E);
  return;
|
+ posix_acl_release(E);
  return ret;
)
  ...+>

@@
type T;
identifier E;
expression E1, E2;
int ret;
statement S;
@@

  T E = \(posix_acl_clone\|posix_acl_alloc\|posix_acl_dup\)(...);
  ...
  if (E == NULL) S
  ... when != E2 = E
      when strict
(
  posix_acl_release(E);
|
  E1 = E;
|
+ posix_acl_release(E);
  return;
|
+ posix_acl_release(E);
  return ret;
)
