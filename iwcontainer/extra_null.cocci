@r@
identifier fn;
expression E;
@@

INIT_WORK(E,fn);

@bad@
identifier r.fn;
@@

fn(...)

@depends on !bad@
identifier r.fn, work,x,fld;
type T;
expression E1,E2;
statement S;
@@

static fn(struct work_struct *work) {
  ... when != work = E1
  x = container_of(work,T,fld)
  ... when != x = E2
- if (x == NULL) S
  ...
}