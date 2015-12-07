//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
identifier x,virtual.ty;
position p;
@@

const struct ty x@p = ...;

@@
identifier x,virtual.ty;
position p != r.p;
@@

+const
 struct ty x@p = ...;

@ra@
identifier x,virtual.ty;
position p;
@@

const struct ty *x@p = ...;

@@
identifier x,virtual.ty;
position p != ra.p;
@@

+const
 struct ty *x@p = ...;

@rb@
identifier x,virtual.ty;
position p;
@@

const struct ty x@p[] = ...;

@@
identifier x,virtual.ty;
position p != rb.p;
@@

+const
 struct ty x@p[] = ...;

@rc@
identifier x,virtual.ty;
position p;
@@

const struct ty *x@p[...];

@@
identifier x,virtual.ty;
position p != rc.p;
@@

+const
 struct ty *x@p[...];

@rr@
identifier f,x,virtual.ty;
position p;
@@

f(...,const struct ty *x@p,...) { ... }

@@
identifier f,x,virtual.ty;
position p != rr.p;
@@

f(...,
+ const
  struct ty *x@p,...) { ... }

@rrpp@
identifier f,x,virtual.ty;
position p;
@@

f(...,const struct ty **x@p,...) { ... }

@@
identifier f,x,virtual.ty;
position p != rrpp.p;
@@

f(...,
+ const
  struct ty **x@p,...) { ... }

@rrp@
identifier f,x,virtual.ty;
position p;
type T;
@@

T f(...,const struct ty *x@p,...);

@@
identifier f,x,virtual.ty;
position p != rrp.p;
type T;
@@

T f(...,
+ const
  struct ty *x@p,...);

@rrppp@
identifier f,x,virtual.ty;
position p;
type T;
@@

T f(...,const struct ty **x@p,...);

@@
identifier f,x,virtual.ty;
position p != rrppp.p;
type T;
@@

T f(...,
+ const
  struct ty **x@p,...);

@rra@
identifier f,virtual.ty;
position p;
@@

const struct ty@p * f(...) { ... }

@@
identifier f,virtual.ty;
position p != rra.p;
@@

+const
 struct ty@p * f(...) { ... }

@rrap@
identifier f,virtual.ty;
position p;
@@

const struct ty@p * f(...);

@@
identifier f,virtual.ty;
position p != rrap.p;
@@

+const
 struct ty@p * f(...);

@rrr@
identifier i,x,virtual.ty;
position p;
@@

struct i {
  ...
  const struct ty@p *x;
  ...
};

@@
identifier i,x,virtual.ty;
position p != rrr.p;
@@

struct i {
  ...
+ const
  struct ty@p *x;
  ...
};

@rrrr@
identifier x,virtual.ty;
position p;
@@

  const struct ty@p *x;

@@
identifier x,virtual.ty;
position p != rrrr.p;
@@

+ const
  struct ty@p *x;

@rrrra@
identifier x,virtual.ty;
position p;
@@

  const struct ty@p x;

@@
identifier x,virtual.ty;
position p != rrrra.p;
@@

+ const
  struct ty@p x;
