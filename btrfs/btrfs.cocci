//
//  Add missing btrfs_free_path
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@rule1016 exists@
local idexpression struct btrfs_path * x;
expression rb,nb,ra,rr;
identifier fb,fldb,fa;
position p1,p2;
int i;
statement S1,S2;
expression e1, e2;
@@

x = btrfs_alloc_path@p1(...)
...  when != x = rb
     when != fb(...,x,...)
     when != nb->fldb = x
     when != *nb = x
(
btrfs_insert_empty_item(e1, e2, x,...)
|
btrfs_lookup_dir_item(e1, e2, x,...)
)
...  when != x = rr
     when != fa(...,x,...)
     when any
     when != true x == NULL
     when != true IS_ERR(x)
     when != true IS_ERR_OR_NULL(x)
     when != btrfs_free_path(x,...)
     when != if (...) { ... btrfs_free_path(x,...) ...}
(
if(<+... i == 0 ...+>) S1
|
if(<+...x...+>) S1 else S2
|
if(...) { ... when != x = ra
     when forall
     when != btrfs_free_path(x,...)
 \(return <+...x...+>; \| return@p2...; \) }
)

@script:python@
p1 << rule1016.p1;
p2 << rule1016.p2;
@@

cocci.print_main("1016: btrfs_alloc_path: btrfs_free_path",p1)
cocci.print_secs("",p2)

