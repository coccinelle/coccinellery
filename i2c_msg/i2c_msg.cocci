//
//  Use macros for i2c_msg initialization
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
field list[n] ds;
type T;
identifier i;
@@

struct i2c_msg {
  ds
  T i;
  ...
};

@@
initializer list[r.n] is;
expression a;
identifier nm;
identifier r.i;
@@

struct i2c_msg nm = {
  is,
- a
+  .i = a
  ,...
};

@@
initializer list[r.n] is;
expression a;
identifier nm;
identifier r.i;
@@

struct i2c_msg nm[...] = { ..., {
  is,
- a
+  .i = a
  ,...}, ...};

@@
initializer list[r.n] is;
expression a;
identifier nm;
identifier r.i;
@@

struct i2c_msg nm[] = { ..., {
  is,
- a
+  .i = a
  ,...}, ...};

// --------------------------------------------------------------------
// ensure everyone has all fields, pointer case first

@rt@
type T;
identifier i;
@@

struct i2c_msg {
  ...
  T *i;
  ...
};

@t1@
expression e;
identifier nm,rt.i;
position p;
@@

struct i2c_msg nm = {@p
  .i = e,
};

@@
identifier nm,rt.i;
position p!= t1.p;
@@

struct i2c_msg nm = {@p
+ .i = NULL,
  ...
};

@t2@
expression e;
identifier nm,rt.i;
position p;
@@

struct i2c_msg nm[] = { ..., {@p
  .i = e,
}, ...};

@@
identifier nm,rt.i;
position p!= t2.p;
@@

struct i2c_msg nm[] = { ..., {@p
+ .i = NULL,
  ...
}, ...};

@t3@
expression e;
identifier nm,rt.i;
position p;
@@

struct i2c_msg nm[...] = { ..., {@p
  .i = e,
}, ...};

@@
identifier nm,rt.i;
position p!= t3.p;
@@

struct i2c_msg nm[...] = { ..., {@p
+ .i = NULL,
  ...
}, ...};

// ---------------------------------

@f1@
expression e;
identifier nm,r.i;
position p;
@@

struct i2c_msg nm = {@p
  .i = e,
};

@@
identifier nm,r.i;
position p!= f1.p;
@@

struct i2c_msg nm = {@p
+ .i = 0,
  ...
};

@f2@
expression e;
identifier nm,r.i;
position p;
@@

struct i2c_msg nm[] = { ..., {@p
  .i = e,
}, ...};

@@
identifier nm,r.i;
position p!= f2.p;
@@

struct i2c_msg nm[] = { ..., {@p
+ .i = 0,
  ...
}, ...};

@f3@
expression e;
identifier nm,r.i;
position p;
@@

struct i2c_msg nm[...] = { ..., {@p
  .i = e,
}, ...};

@@
identifier nm,r.i;
position p!= f3.p;
@@

struct i2c_msg nm[...] = { ..., {@p
+ .i = 0,
  ...
}, ...};

// --------------------------------------------------------------------

@@
constant c;
identifier x;
type T,T1;
T[] b;
@@

struct i2c_msg x =
  { .buf = \((T1)b\|(T1)(&b)\|(T1)(&b[0])\), .len =
(
0
|
  sizeof (...)
|
- c
+ sizeof(b)
)
  };

@@
constant c;
identifier x;
type T,T1;
T[] b;
@@

struct i2c_msg x[...] =  {...,
  { .buf = \((T1)b\|(T1)(&b)\|(T1)(&b[0])\), .len =
(
0
|
  sizeof (...)
|
- c
+ sizeof(b)
)
  } ,...};

@@
constant c;
identifier x;
type T,T1;
T[] b;
@@

struct i2c_msg x[] =  {...,
  { .buf = \((T1)b\|(T1)(&b)\|(T1)(&b[0])\), .len =
(
0
|
  sizeof (...)
|
- c
+ sizeof(b)
)
  } ,...};

@@
constant c;
identifier x;
type T1;
expression b;
@@

struct i2c_msg x =
  { .buf = (T1)(&b), .len =
(
0
|
  sizeof (...)
|
- c
+ sizeof(b)
)
  };

@@
constant c;
identifier x;
type T1;
expression b;
@@

struct i2c_msg x[...] =  {...,
  { .buf = (T1)(&b), .len =
(
0
|
  sizeof (...)
|
- c
+ sizeof(b)
)
  } ,...};

@@
constant c;
identifier x;
type T1;
expression b;
@@

struct i2c_msg x[] =  {...,
  { .buf = (T1)(&b), .len =
(
0
|
  sizeof (...)
|
- c
+ sizeof(b)
)
  } ,...};

// --------------------------------------------------------------------

@@
expression a,b,c;
identifier x;
@@

struct i2c_msg x =
- {.addr = a, .buf = b, .len = c, .flags = I2C_M_RD}
+ I2C_MSG_READ(a,b,c)
 ;

@@
expression a,b,c;
identifier x;
@@

struct i2c_msg x =
- {.addr = a, .buf = b, .len = c, .flags = 0}
+ I2C_MSG_WRITE(a,b,c)
 ;

// has to come before the next rule, which matcher fewer fields
@@
expression a,b,c,d;
identifier x;
@@

struct i2c_msg x = 
- {.addr = a, .buf = b, .len = c, .flags = d}
+ I2C_MSG_OP(a,b,c,d)
 ;

// --------------------------------------------------------------------

@@
expression a,b,c;
identifier x;
@@

struct i2c_msg x[] = {...,
- {.addr = a, .buf = b, .len = c, .flags = I2C_M_RD}
+ I2C_MSG_READ(a,b,c)
 ,...};

@@
expression a,b,c;
identifier x;
@@

struct i2c_msg x[] = {..., 
- {.addr = a, .buf = b, .len = c, .flags = 0}
+ I2C_MSG_WRITE(a,b,c)
 ,...};

@@
expression a,b,c,d;
identifier x;
@@

struct i2c_msg x[] =  {...,
- {.addr = a, .buf = b, .len = c, .flags = d}
+ I2C_MSG_OP(a,b,c,d)
 ,...};

// --------------------------------------------------------------------

@@
expression a,b,c;
identifier x;
@@

struct i2c_msg x[...] =  {...,
- {.addr = a, .buf = b, .len = c, .flags = I2C_M_RD}
+ I2C_MSG_READ(a,b,c)
 ,...};

@@
expression a,b,c;
identifier x;
@@

struct i2c_msg x[...] =  {...,
- {.addr = a, .buf = b, .len = c, .flags = 0}
+ I2C_MSG_WRITE(a,b,c)
 ,...};

@@
expression a,b,c,d;
identifier x;
@@

struct i2c_msg x[...] = {...,
- {.addr = a, .buf = b, .len = c, .flags = d}
+ I2C_MSG_OP(a,b,c,d)
 ,...};

// --------------------------------------------------------------------
// got everything?

@check1@
identifier nm;
position p;
@@

struct i2c_msg nm@p = {...};

@script:python@
p << check1.p;
@@

cocci.print_main("",p)

@check2@
identifier nm;
position p;
@@

struct i2c_msg nm@p [] = {...,{...},...};

@script:python@
p << check2.p;
@@

cocci.print_main("",p)

@check3@
identifier nm;
position p;
@@

struct i2c_msg nm@p [...] = {...,{...},...};

@script:python@
p << check3.p;
@@

cocci.print_main("",p)
