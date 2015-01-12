@@
expression t,d,f,e1,e2;
identifier x1,x2;
statement S1,S2;
@@

(
-t.data = d;
|
-t.function = f;
|
-init_timer(&t);
+setup_timer(&t,f,d);
|
-init_timer_on_stack(&t);
+setup_timer_on_stack(&t,f,d);
)
<... when != S1
t.x1 = e1;
...>
(
-t.data = d;
|
-t.function = f;
|
-init_timer(&t);
+setup_timer(&t,f,d);
|
-init_timer_on_stack(&t);
+setup_timer_on_stack(&t,f,d);
)
<... when != S2
t.x2 = e2;
...>
(
-t.data = d;
|
-t.function = f;
|
-init_timer(&t);
+setup_timer(&t,f,d);
|
-init_timer_on_stack(&t);
+setup_timer_on_stack(&t,f,d);
)

// ----------------------

@@
expression t,d,f,e1,e2;
identifier x1,x2;
statement S1,S2;
@@

(
-t->data = d;
|
-t->function = f;
|
-init_timer(t);
+setup_timer(t,f,d);
|
-init_timer_on_stack(t);
+setup_timer_on_stack(t,f,d);
)
<... when != S1
t->x1 = e1;
...>
(
-t->data = d;
|
-t->function = f;
|
-init_timer(t);
+setup_timer(t,f,d);
|
-init_timer_on_stack(t);
+setup_timer_on_stack(t,f,d);
)
<... when != S2
t->x2 = e2;
...>
(
-t->data = d;
|
-t->function = f;
|
-init_timer(t);
+setup_timer(t,f,d);
|
-init_timer_on_stack(t);
+setup_timer_on_stack(t,f,d);
)

// ---------------------------------------------------------------------

@@
expression t,d1,d2,f;
@@

(
-init_timer(&t);
+setup_timer(&t,f,0UL);
|
-init_timer_on_stack(&t);
+setup_timer_on_stack(&t,f,0UL);
)
... when != t.data = d1;
-t.function = f;
... when != t.data = d2;
add_timer(&t);

@@
expression t,d,f,fn;
type T;
@@

-t.function = f;
... when != t.data
    when != fn(...,(T)t,...)
(
-init_timer(&t);
+setup_timer(&t,f,d);
|
-init_timer_on_stack(&t);
+setup_timer_on_stack(&t,f,0UL);
)
... when != t.data = d;
add_timer(&t);

// ----------------------

@@
expression t,d1,d2,f;
@@

(
-init_timer(t);
+setup_timer(t,f,0UL);
|
-init_timer_on_stack(t);
+setup_timer_on_stack(t,f,0UL);
)
... when != t->data = d1;
-t->function = f;
... when != t->data = d2;
add_timer(t);

@@
expression t,d,f,fn;
type T;
@@

-t->function = f;
... when != t.data
    when != fn(...,(T)t,...)
(
-init_timer(t);
+setup_timer(t,f,d);
|
-init_timer_on_stack(t);
+setup_timer_on_stack(t,f,0UL);
)
... when != t->data = d;
add_timer(t);

// ---------------------------------------------------------------------

@@
expression d;
type T;
@@

(
setup_timer
|
setup_timer_on_stack
)
 (...,
(
  (unsigned long)d
|
- (T)
+ (unsigned long)
  d
)
 )
