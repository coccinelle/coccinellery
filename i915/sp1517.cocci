@rule1517 exists@
local idexpression struct page * * x;
expression rb,nb,ra,rr;
identifier fb,fldb,fa;
position p1,p2;
int i;
statement S1,S2;
expression e1, e2, e3, e4, e5, e6;
@@

x = drm_malloc_ab@p1(...)
...  when != x = rb
    when != fb(...,x,...)
  when != nb->fldb = x
 when != *nb = x
get_user_pages(e1, e2, e3, e4, e5, e6, x,...)
...  when != x = rr
     when != fa(...,x,...)
     when any
     when != true x == NULL
     when != true IS_ERR(x)
     when != true IS_ERR_OR_NULL(x)
     when != drm_free_large(x,...)
     when != if (...) { ... drm_free_large(x,...) ...}
(
if(<+... i == 0 ...+>) S1
|
if(<+...x...+>) S1 else S2
|
if(...) { ... when != x = ra
     when forall
     when != drm_free_large(x,...)
 \(return <+...x...+>; \| return@p2...; \) }
)

@script:python@
p1 << rule1517.p1;
p2 << rule1517.p2;
@@

cocci.print_main("1517: drm_malloc_ab: drm_free_large",p1)
cocci.print_secs("",p2)

