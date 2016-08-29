@r disable optional_qualifier@
identifier i;
position p;
@@

static struct i2c_algorithm i@p = { ... };

@ok1 disable fld_to_ptr@
identifier r.i;
struct i2c_adapter e;
position p;
@@

e.alg = &i@p

@ok2@
identifier r.i;
struct i2c_adapter *e;
position p;
@@

e->alg = &i@p

@ok3@
identifier r.i,j;
position p;
@@

struct i2c_adapter j = { .algo = &i@p, };

@bad@
position p != {r.p,ok1.p,ok3.p,ok2.p};
identifier r.i;
@@

i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct i2c_algorithm i = { ... };
