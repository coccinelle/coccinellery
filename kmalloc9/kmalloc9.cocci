@r@
position p1;
local idexpression x;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)

@s exists@
local idexpression x;
statement S;
expression E1,E2;
identifier fn1,fn2,f1,f2,l;
position r.p1,p2,p3;
expression *ptr != NULL;
char [] c1,c2;
identifier pr;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) == NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x == NULL) S
)
<... when != x
     when != if (...) { <+...kfree(x)...+> }
     when any
     when != true x == NULL
(
 (<+...x->f1...+>) = E1
|
 ((<+...x->f1...+>) == NULL || ...)
|
 sizeof(*x)
|
 fn1(...,x->f1,...)
|
 \(memcpy\|memset\)(...,x,...)
|
 \(pci_read_config_byte\|pci_read_config_word\|pci_write_config_byte\|pci_write_config_word\)(...,&x->f1,...)
|
pr(c1,...,x,...)
)
...>
goto@p3 l;
<... when != x
     when != if (...) { <+...kfree(x)...+> }
     when any
     when != true x == NULL
(
 (<+...x->f2...+>) = E2
|
 ((<+...x->f2...+>) == NULL || ...)
|
 sizeof(*x)
|
 fn2(...,x->f2,...)
|
 \(memcpy\|memset\)(...,x,...)
|
 \(pci_read_config_byte\|pci_read_config_word\|pci_write_config_byte\|pci_write_config_word\)(...,&x->f2,...)
|
pr(c2,...,x,...)
)
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << s.p2;
p3 << s.p3;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)
cocci.print_secs("",p3,"ovl-face3")
cocci.include_match(False)

@t exists@
local idexpression x;
statement S,S1;
expression E;
identifier f,f1;
position r.p1,p2;
expression *ptr != NULL;
char [] c;
identifier pr;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) == NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x == NULL) S
)
<... when != x
     when != if (...) { <+...kfree(x)...+> }
     when any
     when != true x == NULL
(
 (<+...x->f1...+>) = E
|
 ((<+...x->f1...+>) == NULL || ...)
|
 sizeof(*x)
|
 f(...,x->f1,...)
|
 \(memcpy\|memset\)(...,x,...)
|
 \(pci_read_config_byte\|pci_read_config_word\|pci_write_config_byte\|pci_write_config_word\)(...,&x->f1,...)
|
pr(c,...,x,...)
)
...>
(
if (x == NULL) S1
|
if (...) { ... when != x
               when forall
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)
...
}
)

@script:python@
p1 << r.p1;
p2 << t.p2;
@@

cocci.print_main("",p1)
cocci.print_secs("",p2)
cocci.include_match(False)
