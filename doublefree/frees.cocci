@r1@
expression E;
position p1,p2;
@@

kfree@p1(E);
...
kfree@p2(E);

@subexps@
expression E1;
position r1.p1,p;
@@

kfree@p1(<+... E1@p ...+>);

@recollect@
position subexps.p;
expression E1;
@@

E1@p

@doublekfree@
position r1.p1,r1.p2;
expression recollect.E1,E2,E;
position p;
iterator list_for_each_entry_safe_reverse;
iterator list_for_each_entry_safe;
iterator list_for_each_safe;
iterator hlist_for_each_entry_safe_reverse;
iterator hlist_for_each_entry_safe;
iterator hlist_for_each_safe;
statement S;
@@

kfree@p1(E);
<+...
(
list_for_each_entry_safe_reverse(E1@p,...) S
|
list_for_each_entry_safe(E1@p,...) S
|
list_for_each_safe(E1@p,...) S
|
hlist_for_each_entry_safe_reverse(E1@p,...) S
|
hlist_for_each_entry_safe(E1@p,...) S
|
hlist_for_each_safe(E1@p,...) S
|
E1@p=E2
|
E1@p+=E2
|
E1@p-=E2
|
&E1@p
|
E1@p++
|
E1@p--
|
  ++E1@p
|
  --E1@p
)
...+>
kfree@p2(E);

@notdoublekfree@
position r1.p1,r1.p2;
position any doublekfree.p;
expression E,E1,E2;
@@

* kfree@p1(E);
... when != E1@p
    when != E1@p = E2 // needed to match a variable decl
* kfree@p2(E);
