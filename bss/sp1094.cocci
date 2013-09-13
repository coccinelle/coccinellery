@rule1094 exists@
local idexpression struct cfg80211_bss * x;
expression ra,rr;
identifier fa;
position p1,p2;
int i;
statement S1,S2;
@@

x = cfg80211_get_bss@p1(...)
...  when != x = rr
     when != fa(...,x,...)
     when any
     when != true x == NULL
     when != true IS_ERR(x)
     when != true IS_ERR_OR_NULL(x)
     when != cfg80211_put_bss(x,...)
     when != if (...) { ... cfg80211_put_bss(x,...) ...}
(
if(<+... i == 0 ...+>) S1
|
if(<+...x...+>) S1 else S2
|
if(...) { ... when != x = ra
     when forall
     when != cfg80211_put_bss(x,...)
 \(return <+...x...+>; \| return@p2...; \) }
)

@script:python@
p1 << rule1094.p1;
p2 << rule1094.p2;
@@

cocci.print_main("1094: cfg80211_get_bss: cfg80211_put_bss",p1)
cocci.print_secs("",p2)

