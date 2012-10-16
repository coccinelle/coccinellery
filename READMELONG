Coccinelle Semantic Patch Repository


See short index: README


9p/category2a_p9_client_walk.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function p9_client_walk returns an ERR pointer,
	but never returns a NULL pointer. So a NULL test that comes after an
	IS_ERR test should be deleted.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x = p9_client_walk(...)
	... when != x = E
	*  if (x != NULL) 
	S1 else S2
	// </smpl>
	

9p/p9_client_walk.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function p9_client_walk returns an ERR pointer,
	but never returns a NULL pointer. So a NULL test that comes after an
	IS_ERR test should be deleted.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x = p9_client_walk(...)
	... when != x = E
	*  if (x != NULL) 
	S1 else S2
	// </smpl>
	

aaci/category2a_aaci_init_card.cocci -  Bad NULL test

	----------------------------
	
	
	In case of error, the function aaci_init_card returns an ERR pointer,
	but never returns a NULL pointer. We have noticed a bad NULL test,
	which comes after a call to this function. Rather than doing an IS_ERR
	test, we suggest to duplicate the label out: one label for the case
	where aaci_init_card returns a valid pointer, and another for the case
	where aaci_init_card returns an ERR pointer.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x =  aaci_init_card(...)
	... when != x = E
	*  if (x != NULL) 
	S1 else S2
	// </smpl>
	

acl/patch.cocci -  Add missing call to posix_acl_release

	fs/jffs2/acl.c
	
	Send to:
	dwmw2@infradead.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] fs/jffs2: Add missing call to posix_acl_release
	
	------------------------------------------------------
	
	
	posix_acl_clone does a memory allocation and sets a reference count, so
	posix_acl_release is needed afterwards to free it.
	
	
	The problem was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T;
	identifier E;
	expression E1, E2;
	int ret;
	statement S;
	@@
	
	  T E;
	  <+...
	(
	  E = \(posix_acl_clone\|posix_acl_alloc\|posix_acl_dup\)(...);
	  if (E == NULL) S
	|
	  if ((E = \(posix_acl_clone\|posix_acl_alloc\|posix_acl_dup\)(...)) == NULL) S
	)
	  ... when != E2 = E
	      when strict
	(
	  posix_acl_release(E);
	|
	  E1 = E;
	|
	+ posix_acl_release(E);
	  return;
	|
	+ posix_acl_release(E);
	  return ret;
	)
	  ...+>
	// </smpl>
	

acpi/category2b_back_device_reg.cocci -  dereference without an error test

	----------------------------
	
	
	After a variable is assigned the result of backlight_device_register, an error
	test should be performed before a dereference. 
	
	A simplified version of the semantic match that finds this problem is
	as follows: 
	(http://www.emn.fr/x-info/coccinelle/)
	// <smpl>
	@def0@
	expression x;
	position p0;
	@@
	
	x@p0 = backlight_device_register(...)
	
	@protected@
	expression def0.x,E;
	position def0.p0;
	position p;
	statement S;
	@@
	x@p0
	... when != x = E
	if (!IS_ERR(x) && ...) {<... x@p ...>} else S
	
	@unprotected@
	expression def0.x,E;
	identifier fld;
	position def0.p0;
	position p != protected.p;
	@@
	x@p0
	... when != x = E
	* x@p->fld
	// </smpl>
	

acpid/acpi.cocci -  Description not available

	Description not available

after_netif/after_netif.cocci -  Fix use of skb after netif_rx

	jdike@karaya.com, wangchen@cn.fujitsu.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	
	Subject: [PATCH 1/3] Fix use of skb after netif_rx
	
	------------------------------------------------------
	
	
	Recently, Wang Chen submitted a patch
	(d30f53aeb31d453a5230f526bea592af07944564) to move a call to netif_rx(skb)
	after a subsequent reference to skb, because netif_rx may call kfree_skb on
	its argument.  The same problem occurs in some other drivers as well.
	
	This was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression skb, e,e1;
	@@
	
	(
	 netif_rx(skb);
	|
	 netif_rx_ni(skb);
	)
	  ... when != skb = e
	(
	  skb = e1
	|
	* skb
	)
	// </smpl>
	

after_netif/after_netif_modif.cocci -  Fix use of skb after netif_rx

	jdike@karaya.com, wangchen@cn.fujitsu.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	
	Subject: [PATCH 1/3] Fix use of skb after netif_rx
	
	------------------------------------------------------
	
	
	Recently, Wang Chen submitted a patch
	(d30f53aeb31d453a5230f526bea592af07944564) to move a call to netif_rx(skb)
	after a subsequent reference to skb, because netif_rx may call kfree_skb on
	its argument.  The same problem occurs in some other drivers as well.
	
	This was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression skb, e,e1;
	@@
	
	(
	 netif_rx(skb);
	|
	 netif_rx_ni(skb);
	)
	  ... when != skb = e
	(
	  skb = e1
	|
	* skb
	)
	// </smpl>
	

alloc9/kmalloc9.cocci -  Eliminate memory leak

	----------------------------
	
	
	dev_alloc_skb allocates some memory, so that memory should be freed before
	leaving the function in an error case.
	
	Corrected some typos in a nearby comment as well.
	
	A simplified version of the semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E;
	identifier f1;
	iterator I;
	@@
	
	x = dev_alloc_skb(...);
	<... when != x
	     when != true (x == NULL || ...)
	     when != if (...) { <+...x...+> }
	     when != I (...) { <+...x...+> }
	(
	 x == NULL
	|
	 x == E
	|
	 x->f1
	)
	...>
	* return ...;
	// </smpl>
	

alloc_cast/alloc_cast.cocci -  Drop memory allocation cast

	Greg Kroah-Hartman <gregkh@suse.de>,devel@driverdev.osuosl.org,linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 3/5] drivers/staging: Drop memory allocation cast
	
	
	----------------------------
	
	
	Drop cast on the result of kmalloc and similar functions.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	type T;
	@@
	
	- (T *)
	  (\(kmalloc\|kzalloc\|kcalloc\|kmem_cache_alloc\|kmem_cache_zalloc\|
	   kmem_cache_alloc_node\|kmalloc_node\|kzalloc_node\)(...))
	// </smpl>
	

alloc_domain/easykmret.cocci -  add missing free_domain_mem

	Add missing free_domain_mem on failure path after alloc_domain.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@km exists@
	local idexpression e;
	expression e1,e2,e3;
	type T,T1;
	identifier f;
	@@
	
	* e = alloc_domain(...)
	... when any
	    when != e = e1
	    when != e1 = (T)e
	    when != e1(...,(T)e,...)
	    when != &e->f
	if(...) { ... when != e2(...,(T1)e,...)
	                 when != e3 = e
	                 when forall
	(
	             return <+...e...+>;
	|
	*             return ...;
	) }
	// </smpl>
	

alloc_etherdev/alloc.cocci -  adjust error handling

	----------------------------
	
	
	The just preceding error case does a lot of error handling, so it seems
	like this one should as well.
	
	The semantic match that found the problem is:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E,E1,E2;
	@@
	
	E = alloc_etherdev(...)
	... when != E = E1
	if (...) { ... free_netdev(E); ... return ...; }
	... when != E = E2
	(
	  if (...)
	   {
	   ... when != free_netdev(E);
	   return dev; }
	|
	* if (...)
	   {
	   ... when != free_netdev(E);
	   return ...; }
	|
	register_netdev(E)
	)
	
	// </smpl>
	

alloc_tty/alloc_tty.cocci -  add missing put_tty_driver

	----------------------------
	
	
	alloc_tty_driver is called at the beginning of the function containing the
	lines of code shown in the patch.  Thus, put_tty_driver is needed before
	returning in the error handling code.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@nr exists@
	local idexpression x;
	expression E,f;
	position p1,p2,p3;
	identifier l;
	statement S;
	@@
	
	x = alloc_tty_driver@p1(...)
	...
	if (x == NULL) S
	... when != E = x
	    when != put_tty_driver(x)
	    when != goto l;
	(
	return \(0\|x\);
	|
	return@p3 ...;
	)
	
	@script:python@
	p1 << nr.p1;
	p3 << nr.p3;
	@@
	
	print \"%s: call on line %s not freed or saved before return on line %s\" % (p1[0].file,p1[0].line,p3[0].line)
	// </smpl>
	

allocs/a2.cocci -  add missing fput

	----------------------------
	
	
	fget increments a reference count, so fput is needed to decrement it.  I
	have added a goto to the end of the function where there was already such a
	call.
	
	The semantic patch that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	statement S;
	position p1,p2;
	identifier f;
	expression E;
	expression *ptr != NULL;
	@@
	
	 x@p1 = fget(...);
	 ... when != x
	 if (x == NULL) S
	 <... when != x
	      when != if (...) { <+...x...+> }
	  x->f = E
	 ...>
	(
	 return \(0\|<+...x...+>\|ptr\);
	|
	 return@p2 ...;
	)
	
	@ script:python @
	p1 << r.p1;
	p2 << r.p2;
	@@
	print \"%s: call: %s return: %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

arraysize/array.cocci -  use ARRAY_SIZE

	----------------------------
	
	
	ARRAY_SIZE is more concise to use when the size of an array is divided by
	the size of its type or the size of its first element.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@i@
	@@
	
	#include <linux/kernel.h>
	
	@depends on i using \"paren.iso\"@
	type T;
	T[] E;
	@@
	
	- (sizeof(E)/sizeof(E[...]))
	+ ARRAY_SIZE(E)
	// </smpl>
	

arref/arref.cocci -  adjust array index

	Convert array index from the loop bound to the loop index.
	
	A simplified version of the semantic patch that fixes this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e1,e2,ar;
	@@
	
	for(e1 = 0; e1 < e2; e1++) { <...
	  ar[
	- e2
	+ e1
	  ]
	  ...> }
	// </smpl>
	

asprintf/asprintf.cocci -  Use kasprintf

	----------------------------
	
	
	kasprintf combines kmalloc and sprintf, and takes care of the size
	calculation itself.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression a,flag;
	expression list args;
	statement S;
	@@
	
	  a =
	-  \(kmalloc\|kzalloc\)(...,flag)
	+  kasprintf(flag,args)
	  <... when != a
	  if (a == NULL || ...) S
	  ...>
	- sprintf(a,args);
	// </smpl>
	

atm/atm.cocci -  Description not available

	Description not available

auth/auth.cocci -  Adjust error handling code involving auth_domain_put

	----------------------------
	
	
	Once clp is assigned, it never becomes NULL, so we can make a label for it
	in the error handling code.  Because the call to path_lookup follows the
	call to auth_domain_find, its error handling code should jump to this new
	label.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r@
	expression x,E;
	statement S;
	position p1,p2,p3;
	@@
	
	(
	if ((x = auth_domain_find@p1(...)) == NULL || ...) S
	|
	x = auth_domain_find@p1(...)
	... when != x
	if (x == NULL || ...) S
	)
	<...
	if@p3 (...) { ... when != auth_domain_put(x)
	                  when != if (x) { ... auth_domain_put(x); ...}
	    return@p2 ...;
	}
	...>
	(
	return x;
	|
	return 0;
	|
	x = E
	|
	E = x
	|
	auth_domain_put(x)
	)
	
	@exists@
	position r.p1,r.p2,r.p3;
	expression x;
	int ret != 0;
	statement S;
	@@
	
	* x = auth_domain_find@p1(...)
	  <...
	* if@p3 (...)
	  S
	  ...>
	* return@p2 \(NULL\|ret\);
	// </smpl>
	

badand/badand.cocci -  Convert && to ||

	----------------------------
	
	
	The pattern !E && !E->fld is nonsensical.  The patch below updates this
	according to the assumption that && should be ||.  But perhaps another
	solution was intended.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@disable and_comm@
	expression E;
	identifier fld;
	@@
	
	- !E && !E->fld
	+ !E || !E->fld
	// </smpl>
	

badftest/badftest.cocci -  Description not available

	Description not available

badkm/badkm.cocci -  initialize return variable with error code

	Typically, the return value desired for the failure of a memory allocation
	is -ENOMEM.  In this case, the return value is undesirably 0.
	
	The semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	//<smpl>
	@@
	identifier ret,f;
	expression E,E1,x;
	@@
	
	(
	ret = f(...);
	if (ret != 0) { ... when forall
	  return ...; }
	|
	ret = 0
	)
	... when != ret = E
	    when any
	x = \(kmalloc\|kzalloc\|kcalloc\)(...);
	*if(x == NULL) {
	 ... when != ret = E1
	* return ret;
	}
	//</smpl>
	

badkm2/badkm2.cocci -  ensure a consistent return value in error case

	Typically, the return value desired for the failure of a function with an
	integer return value is a negative integer.  In these cases, the return
	value is sometimes a negative integer and sometimes 0, due to a subsequent
	initialization of the return variable within the loop.
	
	A simplified version of the semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	//<smpl>
	@r exists@
	identifier ret;
	position p;
	constant C;
	expression e1,e3,e4;
	statement S;
	@@
	
	ret = -C
	... when != ret = e3
	    when any
	if@p (...) S
	... when any
	if (\(ret != 0\|ret < 0\|ret > 0\) || ...) { ... return ...; }
	... when != ret = e3
	    when any
	*if@p (...)
	{
	  ... when != ret = e4
	  return ret;
	}
	//</smpl>
	

badktest/badktest.cocci -  Correct NULL test

	----------------------------
	
	
	Test the just-allocated value for NULL rather than some other value.
	Adjust the size of the allocated array as well, according to the location
	storing the result.
	
	The semantic patch that makes the first change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,y;
	statement S;
	@@
	
	x = \(kmalloc\|kcalloc\|kzalloc\)(...);
	(
	if ((x) == NULL) S
	|
	if (
	-   y
	+   x
	       == NULL)
	 S
	)
	// </smpl>
	

badmsg/badmsg.cocci -  Return -ENOMEM on memory allocation failure

	----------------------------
	
	
	In this code, 0 is returned on memory allocation failure, even though other
	failures return -ENOMEM or other similar values.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression ret;
	expression x,e1,e2,e3;
	@@
	
	ret = 0
	... when != ret = e1
	*x = \(kmalloc\|kcalloc\|kzalloc\)(...)
	... when != ret = e2
	if (x == NULL) { ... when != ret = e3
	  return ret;
	}
	// </smpl>
	

badmsg3/badmsg3.cocci -  Description not available

	Description not available

badty/badty.cocci -  Correct the size argument to kzalloc

	----------------------------
	
	
	mtd_list has type struct mtd_info **, not struct mtd_info *, so the
	elements of the array should have pointer type, not structure type.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@disable sizeof_type_expr@
	type T;
	T **x;
	@@
	
	  x =
	  <+...sizeof(
	- T
	+ *x
	  )...+>
	// </smpl>
	

bitcall/bitcall.cocci -  convert & to &&

	----------------------------
	
	
	The use of & to obtain a conjunction that evaluates both of its arguments
	seems unnecessarily tricky.
	
	The semantic match that found this code is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@ expression E1, E2; @@
	*  !E1 & !E2
	// </smpl>
	

bits/notand.cocci -  Correct use of ! and &

	----------------------------
	
	
	In commit e6bafba5b4765a5a252f1b8d31cbf6d2459da337, a bug was fixed that
	involved converting !x & y to !(x & y).  The code below shows the same
	pattern, and thus should perhaps be fixed in the same way.
	
	This is not tested and clearly changes the semantics, so it is only
	something to consider.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@ expression E1,E2; @@
	(
	  !E1 & !E2
	|
	- !E1 & E2
	+ !(E1 & E2)
	)
	// </smpl>
	

bits2/notand.cocci -  Correct use of ! and &

	----------------------------
	
	
	Correct priority problem in the use of ! and &.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@ expression E; constant C; @@
	- !E & C
	+ !(E & C)
	// </smpl>
	

block_nil/retsall.cocci -  use BLOCK_NIL

	----------------------------
	
	
	Use BLOCK_NIL consistently rather than sometimes 0xffff and sometimes
	BLOCK_NIL.
	
	The semantic patch that finds this issue is below
	(http://www.emn.fr/x-info/coccinelle/).  On the other hand, the changes
	were made by hand, in part because drivers/mtd/inftlcore.c contains dead
	code that causes spatch to ignore a relevant function.  Specifically, the
	function INFTL_findwriteunit contains a do-while loop, but always takes a
	return that leaves the loop on the first iteration.
	
	// <smpl>
	@r exists@
	identifier f,C;
	@@
	
	f(...) { ... return C; }
	
	@s@
	identifier r.C;
	expression E;
	@@
	
	#define C E
	
	@@
	identifier r.f,r.C,I;
	expression s.E;
	@@
	
	f(...) {
	 <...
	(
	  I
	|
	- E
	+ C
	)
	 ...>
	}
	
	// </smpl>
	

bo/bo.cocci -  trivial: use BUG_ON

	Use BUG_ON(x) rather than if(x) BUG();
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@ identifier x; @@
	-if (x) BUG();
	+BUG_ON(x);
	
	@@ identifier x; @@
	-if (!x) BUG();
	+BUG_ON(!x);
	// </smpl>
	

bond/short_timeout.cocci -  Description not available

	Description not available

bootmem/bootmem.cocci -  Eliminate NULL test and memset after alloc_bootmem

	akinobu.mita@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	
	Subject: [PATCH 12/14] kernel: Eliminate NULL test and memset after alloc_bootmem
	
	------------------------------------------------------
	
	
	As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
	alloc_bootmem and related functions never return NULL and always return a
	zeroed region of memory.  Thus a NULL test or memset after calls to these
	functions is unnecessary.
	
	 kernel/pid.c    |    2 --
	 kernel/printk.c |    5 -----
	 2 files changed, 7 deletions(-)
	
	This was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E;
	statement S;
	@@
	
	E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\)(...)
	... when != E
	(
	- BUG_ON (E == NULL);
	|
	- if (E == NULL) S
	)
	
	@@
	expression E,E1;
	@@
	
	E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\)(...)
	... when != E
	- memset(E,0,E1);
	// </smpl>
	

bootmem2/bootmem.cocci -  Eliminate NULL test and memset after alloc_bootmem

	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	
	Subject: [PATCH 5/5] mm/page_alloc.c: Eliminate NULL test and memset after alloc_bootmem
	
	------------------------------------------------------
	
	
	As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
	alloc_bootmem and related functions never return NULL and always return a
	zeroed region of memory.  Thus a NULL test or memset after calls to these
	functions is unnecessary.
	
	This was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E;
	statement S;
	@@
	
	E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\|alloc_bootmem_node\|alloc_bootmem_low_pages_node\|alloc_bootmem_pages_node\)(...)
	... when != E
	(
	- BUG_ON (E == NULL);
	|
	- if (E == NULL) S
	)
	
	@@
	expression E,E1;
	@@
	
	E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\|alloc_bootmem_node\|alloc_bootmem_low_pages_node\|alloc_bootmem_pages_node\)(...)
	... when != E
	- memset(E,0,E1);
	// </smpl>
	

bss/sp1094.cocci -  Add missing call to cfg80211_put_bss

	A call to cfg80211_get_bss hould be accompanied by a call to
	cfg80211_put_bss in error-handling code.
	
	A simplified version of the semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression struct cfg80211_bss * x;
	expression ra,rr;
	position p1,p2;
	@@
	
	x = cfg80211_get_bss@p1(...)
	...  when != x = rr
	     when != cfg80211_put_bss(x,...)
	     when != if (...) { ... cfg80211_put_bss(x,...) ...}
	if(...) { ... when != x = ra
	     when forall
	     when != cfg80211_put_bss(x,...)
	 \(return <+...x...+>; \| return@p2...; \) }
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	cocci.print_main(\"cfg80211_get_bss\",p1)
	cocci.print_secs(\"return\",p2)
	
	// </smpl>
	

btrfs/btrfs.cocci -  Add missing btrfs_free_path

	Btrfs_alloc_path should be matched with btrfs_free_path in error-handling code.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression struct btrfs_path * x;
	expression ra,rb;
	position p1,p2;
	@@
	
	x = btrfs_alloc_path@p1(...)
	...  when != btrfs_free_path(x,...)
	     when != if (...) { ... btrfs_free_path(x,...) ...}
	     when != x = ra
	if(...) { ... when != x = rb
	     when forall
	     when != btrfs_free_path(x,...)
	 \(return <+...x...+>; \| return@p2...; \) }
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	cocci.print_main(\"alloc\",p1)
	cocci.print_secs(\"return\",p2)
	// </smpl>
	

bugon/newbugon.cocci -  Use BUG_ON

	----------------------------
	
	
	if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
	side-effects to allow a definition of BUG_ON that drops the code completely.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@ disable unlikely @ expression E,f; @@
	
	(
	  if (<... f(...) ...>) { BUG(); }
	|
	- if (unlikely(E)) { BUG(); }
	+ BUG_ON(E);
	)
	
	@@ expression E,f; @@
	
	(
	  if (<... f(...) ...>) { BUG(); }
	|
	- if (E) { BUG(); }
	+ BUG_ON(E);
	)
	// </smpl>
	

cache/cache.cocci -  Description not available

	Description not available

call_kern1/call_kern1.cocci -  Use GFP_ATOMIC when a lock is held

	----------------------------
	
	
	The function adpt_i2o_post_wait is called from several places, in some of
	which, such as adpt_abort, a lock may be held.
	
	The functions adpt_i2o_reparse_lct and adpt_i2o_lct_get are called from
	several places, including adpt_rescan where a lock may be held.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@gfp exists@
	identifier fn;
	position p;
	@@
	
	fn(...) {
	 ... when != spin_unlock_irqrestore
	     when any
	 GFP_KERNEL@p
	 ... when any
	}
	
	@locked@
	identifier gfp.fn;
	@@
	
	spin_lock_irqsave(...)
	...  when != spin_unlock_irqrestore
	fn(...)
	
	@depends on locked@
	position gfp.p;
	@@
	
	- GFP_KERNEL@p
	+ GFP_ATOMIC
	// </smpl>
	

call_kern3/call_kern3.cocci -  Use GFP_ATOMIC when a lock is held

	----------------------------
	
	
	The containing function is called from several places.  At one of them, in
	the function untag_chunk, the spin lock &entry->lock is held.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@gfp exists@
	identifier fn;
	position p;
	@@
	
	fn(...) {
	... when != spin_unlock
	    when any
	  GFP_KERNEL@p
	 ... when any
	}
	
	@locked@
	identifier gfp.fn;
	@@
	
	spin_lock(...)
	... when != spin_unlock
	fn(...)
	
	@depends on locked@
	position gfp.p;
	@@
	
	- GFP_KERNEL@p
	+ GFP_ATOMIC
	// </smpl>
	

capi/capi.cocci -  Adjust error handling code involving capi_ctr_put

	----------------------------
	
	
	After calling capi_ctr_get, error handling code should call
	capi_ctr_put.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r@
	expression x,E;
	statement S;
	position p1,p2,p3;
	@@
	
	(
	if ((x = capi_ctr_get@p1(...)) == NULL || ...) S
	|
	x = capi_ctr_get@p1(...)
	... when != x
	if (x == NULL || ...) S
	)
	<...
	if@p3 (...) { ... when != capi_ctr_put(x)
	                  when != if (x) { ... capi_ctr_put(x); ...}
	    return@p2 ...;
	}
	...>
	(
	return x;
	|
	return 0;
	|
	x = E
	|
	E = x
	|
	capi_ctr_put(x)
	)
	
	@exists@
	position r.p1,r.p2,r.p3;
	expression x;
	int ret != 0;
	statement S;
	@@
	
	* x = capi_ctr_get@p1(...)
	  <...
	* if@p3 (...)
	  S
	  ...>
	* return@p2 \(NULL\|ret\);
	// </smpl>
	

clkput/clkput.cocci -  add missing clk_put

	Jump to the end of the function for the clk_disable and clk_put rather than
	returning directly.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	expression e1,e2;
	statement S;
	@@
	
	e1 = clk_get@p1(...);
	... when != e1 = e2
	    when != clk_put(e1)
	    when any
	if (...) { ... when != clk_put(e1)
	               when != if (...) { ... clk_put(e1) ... }
	* return@p3 ...;
	 } else S
	// </smpl>
	

consts/consts.cocci -  use the constant InterlaceMode

	----------------------------
	
	
	Use the constant InterlaceMode rather than the magic number 0x0080.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r@
	type T;
	T E;
	identifier fld;
	identifier c;
	@@
	
	E->fld & c
	
	@s@
	constant C;
	identifier r.c;
	@@
	
	#define c C
	
	@@
	r.T E;
	identifier r.fld;
	identifier r.c;
	constant s.C;
	@@
	
	 E->fld &
	- C
	+ c
	// </smpl>
	

countptr/countptr.cocci -  remove exceptional & on function name

	----------------------------
	
	
	In this file, function names are otherwise used as pointers without &.
	
	A simplified version of the semantic patch that makes this change is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	identifier f;
	@@
	
	f(...) { ... }
	
	@@
	identifier r.f;
	@@
	
	- &f
	+ f
	// </smpl>
	

cpu/cpu.cocci -  Adjust error handling code involving cpufreq_cpu_put

	----------------------------
	
	
	After calling cpufreq_cpu_get, error handling code should call
	cpufreq_cpu_put.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r@
	expression x,E;
	statement S;
	position p1,p2,p3;
	@@
	
	(
	if ((x = cpufreq_cpu_get@p1(...)) == NULL || ...) S
	|
	x = cpufreq_cpu_get@p1(...)
	... when != x
	if (x == NULL || ...) S
	)
	<...
	if@p3 (...) { ... when != cpufreq_cpu_put(x)
	                  when != if (x) { ... cpufreq_cpu_put(x); ...}
	    return@p2 ...;
	}
	...>
	(
	return x;
	|
	return 0;
	|
	x = E
	|
	E = x
	|
	cpufreq_cpu_put(x)
	)
	
	@exists@
	position r.p1,r.p2,r.p3;
	expression x;
	int ret != 0;
	statement S;
	@@
	
	* x = cpufreq_cpu_get@p1(...)
	  <...
	* if@p3 (...)
	  S
	  ...>
	* return@p2 \(NULL\|ret\);
	// </smpl>
	

cpu_mask/cpu_mask.cocci -  Use set_cpus_allowed_ptr

	----------------------------
	
	
	Use set_cpus_allowed_ptr rather than set_cpus_allowed.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression E1,E2;
	@@
	
	- set_cpus_allowed(E1, cpumask_of_cpu(E2))
	+ set_cpus_allowed_ptr(E1, cpumask_of(E2))
	
	@@
	expression E;
	identifier I;
	@@
	
	- set_cpus_allowed(E, I)
	+ set_cpus_allowed_ptr(E, &I)
	// </smpl>
	

cpufreq/patch.cocci -  Add calls to cpufreq_cpu_put

	drivers/cpufreq/cpufreq.c
	
	
	Send to:
	davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] drivers/cpufreq: Add calls to cpufreq_cpu_put
	
	------------------------------------------------------
	
	
	A call to cpufreq_cpu_get should be matched by a call to cpufreq_cpu_put.
	
	
	The problem was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T;
	identifier E;
	expression E1, E2;
	int ret;
	statement S;
	@@
	
	  T E;
	  ... when any
	(
	  E = cpufreq_cpu_get(...);
	  if (E == NULL) S
	|
	  if ((E = cpufreq_cpu_get(...)) == NULL) S
	)
	  ... when != E2 = E
	      when strict
	(
	  cpufreq_cpu_put(E);
	|
	  E1 = E;
	|
	+ cpufreq_cpu_put(E);
	  return;
	|
	+ cpufreq_cpu_put(E);
	  return ret;
	)
	// </smpl>
	

cris/mutex2.cocci -  Use mutex_unlock rather than spin_unlock

	----------------------------
	
	
	It looks at least odd to apply spin_unlock to a mutex.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@def@
	declarer DEFINE_MUTEX;
	identifier m;
	@@
	
	DEFINE_MUTEX(m);
	
	@@
	identifier def.m;
	@@
	
	(
	- spin_lock(&m)
	+ mutex_lock(&m)
	|
	- spin_unlock(&m)
	+ mutex_unlock(&m)
	)
	// </smpl>
	

crypto/crypto.cocci -  add NULL test around call to crypto_free_hash

	crypto_free_hash calls the function crypto_hash_tfm and then
	crypto_free_tfm on the result.  crypto_free_tfm calls crypto_destroy_tfm,
	which tests this result for NULL and then dereferences it.  crypto_hash_tfm
	returns &tfm->base where tfm is its argument.  base is actually the first
	and only field of a crypto_hash-typed structure, so perhaps one can rely on
	it to return NULL for a NULL value of tfm.  But most calls to
	crypto_hash_tfm where the argument might be NULL don't rely on this
	property and test for NULL explicitly.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@safe@
	position p;
	expression x;
	@@
	
	if (x) { <+... crypto_free_hash@p(x) ...+> }
	
	@@
	expression x;
	position p!=safe.p;
	@@
	
	*x = NULL
	...
	*crypto_free_hash@p(x)
	// </smpl>
	

cstptr/cstptr.cocci -  Move call to PTR_ERR after reassignment

	PTR_ERR should be called before its argument is cleared.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e,e1;
	constant c;
	@@
	
	*e = c
	... when != e = e1
	    when != &e
	    when != true IS_ERR(e)
	*PTR_ERR(e)
	// </smpl>
	
	Reported-by: Josh Triplett <josh@joshtriplett.org>

ctu/ctu.cocci -  initialize all fields

	The c32 structure is allocated on the stack and its idx field is not
	initialized before copying it to user level.  This patch takes the value
	from the result of the ioctl, as done for the other fields.
	

da/da.cocci -  delete double assignment

	Delete successive assignments to the same location.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression i;
	@@
	
	*i = ...;
	 i = ...;
	// </smpl>
	

dall/dall.cocci -  use devm_ functions consistently

	Use devm_kzalloc for all calls to kzalloc and not just the first.  Use devm
	functions for other allocations as well.
	
	Move the call to platform_get_resource(pdev, IORESOURCE_MEM, 0) closer to
	where its result is passed to devm_request_and_ioremap to make the lack of
	need for a NULL test more evident.
	
	The semantic match that finds the inconsistency is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	@@
	
	*devm_kzalloc(...)
	...
	*kzalloc(...)
	// </smpl>
	

dangling/dangling.cocci -  Remove potential for use after free

	In each function, the value apcm is stored in the private_data field of
	runtime.  At the same time the function ct_atc_pcm_free_substream is stored
	in the private_free field of the same structure.  ct_atc_pcm_free_substream
	dereferences and ultimately frees the value in the private_data field.  But
	each function can exit in an error case with apcm having been freed, in
	which case a subsequent call to the private_free function would perform a
	dereference after free.  On the other hand, if the private_free field is
	not initialized, it is NULL, and not invoked (see snd_pcm_detach_substream
	in sound/core/pcm.c).  To avoid the introduction of a dangling pointer, the
	initializations of the private_data and private_free fields are moved to
	the end of the function, past any possible free of apcm.  This is safe
	because the previous calls to snd_pcm_hw_constraint_integer and
	snd_pcm_hw_constraint_minmax, which take runtime as an argument, do not
	refer to either of these fields.
	
	In each function, there is one error case where apcm needs to be freed, and
	a call to kfree is added.
	
	The sematic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e,e1,e2,e3;
	identifier f,free1,free2;
	expression a;
	@@
	
	*e->f = a
	... when != e->f = e1
	    when any
	if (...) {
	  ... when != free1(...,e,...)
	      when != e->f = e2
	* kfree(a)
	  ... when != free2(...,e,...)
	      when != e->f = e3
	}
	// </smpl>
	

depspin/sl.cocci -  Use DEFINE_SPINLOCK

	----------------------------
	
	
	SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
	in Documentation/spinlocks.txt
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	declarer name DEFINE_SPINLOCK;
	identifier xxx_lock;
	@@
	
	- spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
	+ DEFINE_SPINLOCK(xxx_lock);
	// </smpl>
	

derefnull/isnull.cocci -  remove null pointer dereference

	----------------------------
	
	
	If session is NULL, it is not possible to access its name field.  So I have
	split apart the printing of the error message to drop the printing of the
	name field in this case.
	
	The macro PRINTK actually only evaluates its arguments starting with the
	third one if the bitwise conjunction of the first two is non-zero.
	Normally, this conjunction would only be non-zero if debugging mode were
	turned on, but when session is NULL, the first argument in both the old and
	new code is -1, and thus the bitwise conjunction is true.  Perhaps a
	different strategy is desired, such as using tunnel->debug, which
	session->debug is initialized to, but tunnel can also be NULL, so this does
	not completely solve the problem.
	
	
	This problem was found using the following semantic match
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E, E1;
	identifier f;
	statement S1,S2,S3;
	@@
	
	* if (E == NULL)
	{
	  ... when != if (E == NULL) S1 else S2
	      when != E = E1
	* E->f
	  ... when any
	  return ...;
	}
	else S3
	// </smpl>
	

devm2/devm2i.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses devm_kzalloc, devm_request_mem_region and
	devm_ioremap for data that is allocated in the probe function of a platform
	device and is only freed in the remove function.
	

devm2a/devm2i.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	

devm2b/devm2i.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	

devm2i_0729/devm2i.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	

devm2i_0729/request_and_ioremap.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	

devm2i_0730/devm2i.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	

devm2i_0730/request_and_ioremap.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	

devm2i_0731/devm2i.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	

devm2i_0731/request_and_ioremap.cocci -  use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	

devm2i_aug25/devm2i.cocci -  davinci: use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	
	The call to platform_get_resource is moved down to the call to
	devm_request_and_ioremap that uses it.
	

devm2i_aug25/request_and_ioremap.cocci -  davinci: use devm_ functions

	The various devm_ functions allocate memory that is released when a driver
	detaches.  This patch uses these functions for data that is allocated in
	the probe function of a platform device and is only freed in the remove
	function.
	
	The call to platform_get_resource is moved down to the call to
	devm_request_and_ioremap that uses it.
	

devm4/devm4.cocci -  drop iounmap for devm_ allocated data

	Data allocated with devm_ioremap or devm_ioremap_nocache should not be
	freed using iounmap, because doing so causes a dangling pointer, and a
	subsequent double free.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	expression x;
	@@
	(
	 x = devm_ioremap(...)
	|
	 x = devm_ioremap_nocache(...)
	)
	
	@@
	expression r.x;
	@@
	* iounmap(x)
	// </smpl>
	

devm6/devm6.cocci -  use devm_request_and_ioremap

	Reimplement a call to devm_request_mem_region followed by a call to ioremap
	or ioremap_nocache by a call to devm_request_and_ioremap.
	
	The semantic patch that makes this transformation is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@nm@
	expression myname;
	identifier i;
	@@
	
	struct platform_driver i = { .driver = { .name = myname } };
	
	@@
	expression dev,res,size;
	expression nm.myname;
	@@
	
	-if (!devm_request_mem_region(dev, res->start, size,
	-                              \(res->name\|dev_name(dev)\|myname\))) {
	-   ...
	-   return ...;
	-}
	... when != res->start
	(
	-devm_ioremap(dev,res->start,size)
	+devm_request_and_ioremap(dev,res)
	|
	-devm_ioremap_nocache(dev,res->start,size)
	+devm_request_and_ioremap(dev,res)
	)
	... when any
	    when != res->start
	// </smpl>
	

devname/devname.cocci -  eliminate NULL dereference

	----------------------------
	
	
	dev_name always dereferences its argument, so it should not be called if
	the argument is NULL.  The function indeed later tests the argument for
	being NULL.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression dev,E;
	@@
	
	*dev_name(dev)
	... when != dev = E
	(
	*dev == NULL
	|
	*dev != NULL
	)
	// </smpl>
	

diou/diou.cocci -  drop kfree of devm_kzalloc's data

	Using kfree to free data allocated with devm_kzalloc causes double frees.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x;
	@@
	
	x = devm_kzalloc(...)
	...
	?-kfree(x);
	// </smpl>
	

diou2/diou.cocci -  drop devm_kfree of devm_kzalloc'd data

	devm_kfree should not have to be explicitly used.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,d;
	@@
	
	x = devm_kzalloc(...)
	...
	?-devm_kfree(d,x);
	// </smpl>
	

diou3/devm3.cocci -  drop frees of devm_ alloc'd data

	devm free functions should not have to be explicitly used.
	
	A semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	@@
	
	(
	* devm_kfree(...);
	|
	* devm_free_irq(...);
	|
	* devm_iounmap(...);
	|
	* devm_release_region(...);
	|
	* devm_release_mem_region(...);
	)
	// </smpl>
	

dma/set_dma_mode_1.cocci -  Description not available

	Description not available

double_call/dc.cocci -  Eliminate useless code

	----------------------------
	
	
	The variable s is initialized twice to the same (side effect-free)
	expression.  Drop one initialization.
	
	A simplified version of the semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@forall@
	idexpression *x;
	identifier f!=ERR_PTR;
	@@
	
	x = f(...)
	... when != x
	(
	x = f(...,<+...x...+>,...)
	|
	* x = f(...)
	)
	// </smpl>
	

double_lock/double_lock.cocci -  Eliminate a double lock

	----------------------------
	
	
	The path around the loop ends with the lock held, so the call to mutex_lock
	is moved before the beginning of the loop.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@locked@
	expression E1;
	position p;
	@@
	
	read_lock(E1@p,...);
	
	@r exists@
	expression x <= locked.E1;
	expression locked.E1;
	expression E2;
	identifier lock;
	position locked.p,p1,p2;
	@@
	
	*lock@p1 (E1@p,...);
	... when != E1
	    when != \(x = E2\|&x\)
	*lock@p2 (E1,...);
	// </smpl>
	

double_null/double_null.cocci -  Correct NULL test

	----------------------------
	
	
	cohd_fin has already been verified not to be NULL, so the argument to
	BUG_ON cannot be true.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	expression *x;
	expression e;
	identifier l;
	@@
	
	if (x == NULL || ...) {
	    ... when forall
	    return ...; }
	... when != goto l;
	    when != x = e
	    when != &x
	*x == NULL
	// </smpl>
	

double_test/double_test.cocci -  introduce missing initialization

	The result of one call to a function is tested, and then at the second call
	to the same function, the previous result, and not the current result, is
	tested again.
	
	Also changed &bssid to bssid, at the suggestion of Stanislav Yakovlev.
	
	The semantic match that finds the first problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression ret;
	identifier f;
	statement S1,S2;
	@@
	
	*ret = f(...);
	if (\(ret != 0\|ret < 0\|ret == NULL\)) S1
	... when any
	*f(...);
	if (\(ret != 0\|ret < 0\|ret == NULL\)) S2
	// </smpl>
	

doublefree/frees.cocci -  Eliminate double kfree

	jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	
	Subject: [PATCH 1/2] Eliminate double kfree
	
	------------------------------------------------------
	
	
	The destination of goto error also does a kfree(g_iommus), so it is not
	correct to do one here.
	
	This was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
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
	statement S;
	@@
	
	kfree@p1(E);
	<+... E1@p=E2 ...+> // the actual semantic match contains other assignments
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
	// </smpl>
	

doubleinit/doubleinit.cocci -  remove duplicate structure field initialization

	----------------------------
	
	
	The definition of slic_netdev_ops has initializations of a local function
	and eth_mac_addr for its ndo_set_mac_address field.  This change uses only
	the local function.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	identifier I, s, fld;
	position p0,p;
	expression E;
	@@
	
	struct I s =@p0 { ... .fld@p = E, ...};
	
	@s@
	identifier I, s, r.fld;
	position r.p0,p;
	expression E;
	@@
	
	struct I s =@p0 { ... .fld@p = E, ...};
	
	@script:python@
	p0 << r.p0;
	fld << r.fld;
	ps << s.p;
	pr << r.p;
	@@
	
	if int(ps[0].line)!=int(pr[0].line) or int(ps[0].column)!=int(pr[0].column):
	  cocci.print_main(fld,p0)
	// </smpl>
	

doublermr/doublermr.cocci -  Description not available

	Description not available

doubletest/doubletest.cocci -  Remove double test

	The same expression is tested twice and the result is the same each time.
	
	The sematic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@expression@
	expression E;
	@@
	
	(
	* E
	  || ... || E
	|
	* E
	  && ... && E
	)
	// </smpl>
	

doubletest_high/doubletest_highconfidence.cocci -  adjust double test

	Rewrite a duplicated test to test the correct value
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression E;
	@@
	
	(
	* E
	  || ... || E
	|
	* E
	  && ... && E
	)
	// </smpl>
	

drop_continue/cont.cocci -  Drop unnecessary continue

	Send to:
	gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 3/4] drivers/usb: Drop unnecessary continue
	
	
	------------------------------------------------------
	
	
	Continue is not needed at the bottom of a loop.
	
	The semantic patch implementing this change is as follows:
	
	@@
	@@
	
	for (...;...;...) {
	  ...
	  if (...) {
	    ...
	-   continue;
	  }
	}
	

drvdata/drvdata.cocci -  use dev_set_drvdata

	----------------------------
	
	
	Eliminate direct accesses to the driver_data field.
	cf 82ab13b26f15f49be45f15ccc96bfa0b81dfd015
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	struct device *dev;
	expression E;
	type T;
	@@
	
	- dev->driver_data = (T)E
	+ dev_set_drvdata(dev, E)
	
	@@
	struct device *dev;
	type T;
	@@
	
	- (T)dev->driver_data
	+ dev_get_drvdata(dev)
	// </smpl>
	

dst/dst.cocci -  Description not available

	Description not available

enter/enter.cocci -  Convert func_enter to func_exit

	Convert calls to func_enter on leaving a function to func_exit.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	@@
	
	- func_enter();
	+ func_exit();
	  return...;
	// </smpl>
	

epd/epd.cocci -  use USB API functions rather than constants

	----------------------------
	
	
	This set of patches introduces calls to the following set of functions:
	
	usb_endpoint_dir_in(epd)
	usb_endpoint_dir_out(epd)
	usb_endpoint_is_bulk_in(epd)
	usb_endpoint_is_bulk_out(epd)
	usb_endpoint_is_int_in(epd)
	usb_endpoint_is_int_out(epd)
	usb_endpoint_num(epd)
	usb_endpoint_type(epd)
	usb_endpoint_xfer_bulk(epd)
	usb_endpoint_xfer_control(epd)
	usb_endpoint_xfer_int(epd)
	usb_endpoint_xfer_isoc(epd)
	
	In some cases, introducing one of these functions is not possible, and it
	just replaces an explicit integer value by one of the following constants:
	
	USB_ENDPOINT_XFER_BULK
	USB_ENDPOINT_XFER_CONTROL
	USB_ENDPOINT_XFER_INT
	USB_ENDPOINT_XFER_ISOC
	
	An extract of the semantic patch that makes these changes is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r1@ struct usb_endpoint_descriptor *epd; @@
	
	- ((epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\)) ==
	- \(USB_ENDPOINT_XFER_CONTROL\|0\))
	+ usb_endpoint_xfer_control(epd)
	
	@r5@ struct usb_endpoint_descriptor *epd; @@
	
	- ((epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\)) ==
	-  \(USB_DIR_IN\|0x80\))
	+ usb_endpoint_dir_in(epd)
	
	@inc@
	@@
	
	#include <linux/usb.h>
	
	@depends on !inc && (r1||r5)@
	@@
	
	+ #include <linux/usb.h>
	  #include <linux/usb/...>
	// </smpl>
	

epd/mini.cocci -  use USB API functions rather than constants

	----------------------------
	
	
	This set of patches introduces calls to the following set of functions:
	
	usb_endpoint_dir_in(epd)
	usb_endpoint_dir_out(epd)
	usb_endpoint_is_bulk_in(epd)
	usb_endpoint_is_bulk_out(epd)
	usb_endpoint_is_int_in(epd)
	usb_endpoint_is_int_out(epd)
	usb_endpoint_num(epd)
	usb_endpoint_type(epd)
	usb_endpoint_xfer_bulk(epd)
	usb_endpoint_xfer_control(epd)
	usb_endpoint_xfer_int(epd)
	usb_endpoint_xfer_isoc(epd)
	
	In some cases, introducing one of these functions is not possible, and it
	just replaces an explicit integer value by one of the following constants:
	
	USB_ENDPOINT_XFER_BULK
	USB_ENDPOINT_XFER_CONTROL
	USB_ENDPOINT_XFER_INT
	USB_ENDPOINT_XFER_ISOC
	
	An extract of the semantic patch that makes these changes is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r1@ struct usb_endpoint_descriptor *epd; @@
	
	- ((epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\)) ==
	- \(USB_ENDPOINT_XFER_CONTROL\|0\))
	+ usb_endpoint_xfer_control(epd)
	
	@r5@ struct usb_endpoint_descriptor *epd; @@
	
	- ((epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\)) ==
	-  \(USB_DIR_IN\|0x80\))
	+ usb_endpoint_dir_in(epd)
	
	@inc@
	@@
	
	#include <linux/usb.h>
	
	@depends on !inc && (r1||r5)@
	@@
	
	+ #include <linux/usb.h>
	  #include <linux/usb/...>
	// </smpl>
	

epdneg/epdneg.cocci -  Use negated usb_endpoint_xfer_control, etc

	----------------------------
	
	
	This patch extends 42a6e66f1e40a930d093c33ba0bb9d8d8e4555ed by using
	usb_endpoint_xfer_control, usb_endpoint_xfer_isoc, usb_endpoint_xfer_bulk,
	and usb_endpoint_xfer_int in the negated case as well.
	
	This patch also rewrites some calls to usb_endpoint_dir_in as negated calls
	to !usb_endpoint_dir_out, and vice versa, to better correspond to the
	intent of the original code.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@ struct usb_endpoint_descriptor *epd; @@
	
	- (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_CONTROL\|0\))
	+ !usb_endpoint_xfer_control(epd)
	
	@@ struct usb_endpoint_descriptor *epd; @@
	
	- (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_ISOC\|1\))
	+ !usb_endpoint_xfer_isoc(epd)
	
	@@ struct usb_endpoint_descriptor *epd; @@
	
	- (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_BULK\|2\))
	+ !usb_endpoint_xfer_bulk(epd)
	
	@@ struct usb_endpoint_descriptor *epd; @@
	
	- (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_INT\|3\))
	+ !usb_endpoint_xfer_int(epd)
	// </smpl>
	

even_more_pci/get_slot.cocci -  Add missing pci_dev_get

	drivers/char/agp/amd64-agp.c
	
	Send to:
	airlied@linux.ie, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 1/2] drivers/char/agp: Add missing pci_dev_get
	
	------------------------------------------------------
	
	
	pci_get_slot does a pci_dev_get, so pci_dev_put needs to be called in an
	error case.
	
	In the first three cases, it might also be possible to move the call to
	pci_get_slot downwards below the error handling code.
	
	The problem was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	local idexpression *n;
	statement S1,S2;
	expression E,E1;
	expression *ptr != NULL;
	type T,T1;
	@@
	
	(
	if (!(n = pci_get_slot(...))) S1
	|
	n = pci_get_slot(...)
	)
	<... when != pci_dev_put(n)
	    when != if (...) { <+... pci_dev_put(n) ...+> }
	    when != true !n  || ...
	    when != n = (T)E
	    when != E = n
	if (!n || ...) S2
	...>
	(
	  return \(0\|<+...n...+>\|ptr\);
	|
	+ pci_dev_put(n);
	return ...;
	|
	pci_dev_put(n);
	|
	n = (T1)E1
	|
	E1 = n
	)
	// </smpl>
	

extra_put/extra_put.cocci -  Drop unneeded of_node_put

	Send to:
	benh@kernel.crashing.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] arch/powerpc/platforms/powermac: Drop unneeded of_node_put
	
	
	------------------------------------------------------
	
	
	After using for_each_node_by_name, there is no need for of_node_put unless
	there was a break in the loop body, as for_each_node_by_name does a
	of_node_put on each of the elements it returns.
	
	This was detected and fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	iterator for_each_node_by_name;
	expression d;
	@@
	
	  for_each_node_by_name(d,...) {
	    ... when != break;
	  }
	  ... when != d
	?- of_node_put(d);
	// </smpl>
	

fbrelease/metapatch.cocci -  eliminate double free

	adaplas@gmail.com, linux-fbdev-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	
	Subject: [PATCH] drivers/video/pnx4008: eliminate double free
	
	------------------------------------------------------
	
	
	The function framebuffer_release just calls kfree, so calling kfree
	subsequently on the same argument represents a double free.  The
	comments with the definition of framebuffer_release
	in drivers/video/fbsysfs.c suggest that a more elaborate definition of this
	function is planned, such that the splitting up of framebuffer_release and
	kfree as done in the second instance might someday make sense, but it does
	not make sense now. 
	
	This was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E;
	@@
	
	* kfree(E);
	...
	* framebuffer_release(E);
	
	@@
	expression E;
	@@
	
	* framebuffer_release(E);
	...
	* kfree(E);
	// </smpl>
	

fbrelease/patch.cocci -  eliminate double free

	adaplas@gmail.com, linux-fbdev-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	
	Subject: [PATCH] drivers/video/pnx4008: eliminate double free
	
	------------------------------------------------------
	
	
	The function framebuffer_release just calls kfree, so calling kfree
	subsequently on the same argument represents a double free.  The
	comments with the definition of framebuffer_release
	in drivers/video/fbsysfs.c suggest that a more elaborate definition of this
	function is planned, such that the splitting up of framebuffer_release and
	kfree as done in the second instance might someday make sense, but it does
	not make sense now. 
	
	This was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E;
	@@
	
	* kfree(E);
	...
	* framebuffer_release(E);
	
	@@
	expression E;
	@@
	
	* framebuffer_release(E);
	...
	* kfree(E);
	// </smpl>
	

fen/fen.cocci -  Drop unnecessary of_node_put

	----------------------------
	
	
	for_each_node_by_name only exits when its first argument is NULL, and a
	subsequent call to of_node_put on that argument is unnecessary.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	iterator name for_each_node_by_name;
	expression np,E;
	identifier l;
	@@
	
	for_each_node_by_name(np,...) {
	  ... when != break;
	      when != goto l;
	}
	... when != np = E
	- of_node_put(np);
	// </smpl>
	

fields/field.cocci -  Use FIELD_SIZEOF

	----------------------------
	
	
	Robert P.J. Day proposed to use the macro FIELD_SIZEOF in replace of code
	that matches its definition.
	
	The modification was made using the following semantic patch
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@haskernel@
	@@
	
	#include <linux/kernel.h>
	
	@depends on haskernel@
	type t;
	identifier f;
	@@
	
	- (sizeof(((t*)0)->f))
	+ FIELD_SIZEOF(t, f)
	
	@depends on haskernel@
	type t;
	identifier f;
	@@
	
	- sizeof(((t*)0)->f)
	+ FIELD_SIZEOF(t, f)
	// </smpl>
	

frfr/frfr.cocci -  Eliminate double free

	----------------------------
	
	
	The few lines below the kfree of hdr_buf may go to the label err_free which
	will also free hdr_buf.  The most straightforward solution seems to be to
	just move the kfree of hdr_buf after these gotos.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	identifier E;
	expression E1;
	iterator I;
	statement S;
	@@
	
	*kfree(E);
	... when != E = E1
	    when != I(E,...) S
	    when != &E
	*kfree(E);
	// </smpl>
	

fuse/fuse.cocci -  Add missing fuse_request_alloc

	----------------------------
	
	
	The error handling code for the second call to fuse_request_alloc should
	include freeing the result of the first one.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r@
	expression x,E;
	statement S;
	position p1,p2,p3;
	@@
	
	(
	if ((x = fuse_request_alloc@p1(...)) == NULL || ...) S
	|
	x = fuse_request_alloc@p1(...)
	... when != x
	if (x == NULL || ...) S
	)
	<...
	if@p3 (...) { ... when != fuse_request_free(x)
	    return@p2 ...;
	}
	...>
	(
	return x;
	|
	return 0;
	|
	x = E
	|
	E = x
	|
	fuse_request_free(x)
	)
	
	@exists@
	position r.p1,r.p2,r.p3;
	expression x;
	int ret != 0;
	statement S;
	@@
	
	* x = fuse_request_alloc@p1(...)
	  <...
	* if@p3 (...)
	  S
	  ...>
	* return@p2 \(NULL\|ret\);
	
	// </smpl>
	

gdth/gdth.cocci -  Add missing call to gdth_ioctl_free

	----------------------------
	
	
	Add missing call to gdth_ioctl_free before aborting.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression buf,ha,len,addr,E;
	@@
	
	buf = gdth_ioctl_alloc(ha, len, FALSE, &addr)
	... when != false buf != NULL
	    when != true buf == NULL
	    when != \(E = buf\|buf = E\)
	    when != gdth_ioctl_free(ha, len, buf, addr)
	*return ...;
	// </smpl>
	

gfs2/category2a_gfs2_inode_lookup.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function gfs2_inode_lookup returns an
	ERR pointer, but never returns a NULL pointer. So a NULL test that
	necessarily comes after an IS_ERR test should be deleted, and a NULL
	test that may come after a call to this function should be
	strengthened by an IS_ERR test.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x = gfs2_inode_lookup(...)
	... when != x = E
	* if (x != NULL) 
	S1 else S2
	// </smpl>
	

gmc/gmc.cocci -  Avoid call to genlmsg_cancel

	genlmsg_cancel subtracts some constants from its second argument before
	calling nlmsg_cancel.  nlmsg_cancel then calls nlmsg_trim on the same
	arguments.  nlmsg_trim tests for NULL before doing any computation, but a
	NULL second argument to genlmsg_cancel is no longer NULL due to the initial
	subtraction.  Nothing else happens in this execution, so the call to
	genlmsg_cancel is simply unnecessary in this case.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression data;
	@@
	
	if (data == NULL) { ...
	* genlmsg_cancel(..., data);
	  ...
	  return ...;
	}
	// </smpl>
	

handle/handle.cocci -  Description not available

	Description not available

hrtimer/hrtimer.cocci -  use function hrtimer_is_queued

	----------------------------
	
	
	Use the hrtimer_is_queued function rather than an explicit bit-and for
	testing timer->state, as done elsewhere.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@header@
	@@
	
	#include <linux/hrtimer.h>
	
	@depends on header@
	struct hrtimer *timer;
	@@
	
	- (timer->state & HRTIMER_STATE_ENQUEUED)
	+ hrtimer_is_queued(timer)
	// </smpl>
	

i2c_msg/i2c_msg.cocci -  use macros for i2c_msg initialization

	Introduce use of I2c_MSG_READ/WRITE/OP, for readability.
	
	A length expressed as an explicit constant is also re-expressed as the size
	of the buffer, when this is possible.
	
	A simplified version of the semantic patch that makes this change is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
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
	
	@@
	expression a,b,c,d;
	identifier x;
	@@
	
	struct i2c_msg x = 
	- {.addr = a, .buf = b, .len = c, .flags = d}
	+ I2C_MSG_OP(a,b,c,d)
	 ;
	// </smpl>
	

i915/sp1517.cocci -  Add missing error handling code

	The cleanup code at the end of the function should also be carried out when
	the function only partly completes its work.
	
	A simplified version of the semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression struct page ** x;
	expression ra,rr;
	position p1,p2;
	@@
	
	x = drm_malloc_ab@p1(...)
	...  when != x = rr
	     when != drm_free_large(x,...)
	     when != if (...) { ... drm_free_large(x,...) ...}
	if(...) { ... when != x = ra
	     when forall
	     when != drm_free_large(x,...)
	 \(return <+...x...+>; \| return@p2...; \) }
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	cocci.print_main(\"drm_malloc_ab\",p1)
	cocci.print_secs(\"return\",p2)
	
	// </smpl>
	

ie2/ie2.cocci -  Convert IS_ERR result to PTR_ERR

	This code elsewhere returns a negative constant to an indicate an error,
	while IS_ERR returns the result of a >= operation.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x;
	@@
	
	 if (...) { ...
	- return IS_ERR(x);
	+ return PTR_ERR(x);
	}
	// </smpl>
	

if-semicolon/if-semicolon.cocci -  Description not available

	Description not available

ifcol/ifcol.cocci -  Adjust confusing if indentation

	----------------------------
	
	
	Indent the branch of an if.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r disable braces4@
	position p1,p2;
	statement S1,S2;
	@@
	
	(
	if (...) { ... }
	|
	if (...) S1@p1 S2@p2
	)
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	if (p1[0].column == p2[0].column):
	  cocci.print_main(\"branch\",p1)
	  cocci.print_secs(\"after\",p2)
	// </smpl>
	

iff/iff.cocci -  fix error return code

	Convert a possibly 0 error return code to a negative one, as returned
	elsewhere in the function.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@exists@
	local idexpression ret;
	constant C;
	expression e1,e2;
	identifier l;
	@@
	
	* ret = -C;
	  ...
	* if (...)
	 {
	  ... when any
	* if (ret)
	    { ...
	*     return ret;
	    }
	  ... when any
	      when forall
	      when != return ...;
	      when != goto l;
	 }
	... when any
	    when != ret = e1
	* if (...)
	  { ... when != ret = e2
	*   return ret;
	  }
	// </smpl>
	

ifseqerr/ifseqerr.cocci -  Add missing error handling code

	Extend the error handling code with operations found in other nearby error
	handling code.
	
	A simplified version of the sematic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	@r@
	statement S1,S2,S3;
	constant C1,C2,C3;
	@@
	
	*if (...)
	 {... S1 return -C1;}
	...
	*if (...)
	 {... when != S1
	    return -C2;}
	...
	*if (...)
	 {... S1 return -C3;}
	// </smpl>
	

inconsistent/inconsistent1.cocci -  Description not available

	Description not available

infiniband/category2a_ib_create_send_mad.cocci -  Use an IS_ERR test rather than a NULL test

	general@lists.openfabrics.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] drivers/infiniband/core: Use an IS_ERR test rather than a NULL test
	
	----------------------------
	
	
	In case of error, the function ib_create_send_mad returns an ERR pointer,
	but never returns a NULL pointer. So after a call to this function,
	a NULL test should be replaced by an IS_ERR test.
	
	A simplified version of the semantic patch that makes this change is
	as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@correct_null_test@
	expression x,E;
	statement S1, S2;
	@@
	x = ib_create_send_mad(...)
	<... when != x = E
	if (
	(
	- x@p2 != NULL
	+ ! IS_ERR ( x )
	|
	- x@p2 == NULL
	+ IS_ERR( x )
	)
	 )
	S1
	else S2
	...>
	? x = E;
	// </smpl>
	

infiniband/category2a_ucma_alloc_multicast.cocci -  Use an IS_ERR test rather than a NULL test

	general@lists.openfabrics.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] drivers/infiniband/core: Use an IS_ERR test rather than a NULL test
	
	----------------------------
	
	
	In case of error, the function ib_create_send_mad returns an ERR pointer,
	but never returns a NULL pointer. So after a call to this function,
	a NULL test should be replaced by an IS_ERR test.
	
	A simplified version of the semantic patch that makes this change is
	as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@correct_null_test@
	expression x,E;
	statement S1, S2;
	@@
	x = ib_create_send_mad(...)
	<... when != x = E
	if (
	(
	- x@p2 != NULL
	+ ! IS_ERR ( x )
	|
	- x@p2 == NULL
	+ IS_ERR( x )
	)
	 )
	S1
	else S2
	...>
	? x = E;
	// </smpl>
	

input/sp2486.cocci -  Correct call to input_free_device

	This error handling code can be reached before ts_dev->input is
	initialized, so it is safer to always use the original name, input_dev.
	
	A simplified version of the semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression struct input_dev * x;
	expression ra,rr;
	position p1,p2;
	@@
	
	x = input_allocate_device@p1(...)
	...  when != x = rr
	     when != input_free_device(x,...)
	     when != if (...) { ... input_free_device(x,...) ...}
	if(...) { ... when != x = ra
	     when forall
	     when != input_free_device(x,...)
	 \(return <+...x...+>; \| return@p2...; \) }
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	cocci.print_main(\"input_allocate_device\",p1)
	cocci.print_secs(\"input_free_device\",p2)
	// </smpl>
	

input/sp2495.cocci -  Correct call to input_free_device

	This error handling code can be reached before ts_dev->input is
	initialized, so it is safer to always use the original name, input_dev.
	
	A simplified version of the semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression struct input_dev * x;
	expression ra,rr;
	position p1,p2;
	@@
	
	x = input_allocate_device@p1(...)
	...  when != x = rr
	     when != input_free_device(x,...)
	     when != if (...) { ... input_free_device(x,...) ...}
	if(...) { ... when != x = ra
	     when forall
	     when != input_free_device(x,...)
	 \(return <+...x...+>; \| return@p2...; \) }
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	cocci.print_main(\"input_allocate_device\",p1)
	cocci.print_secs(\"input_free_device\",p2)
	// </smpl>
	

input/sp2506.cocci -  Correct call to input_free_device

	This error handling code can be reached before ts_dev->input is
	initialized, so it is safer to always use the original name, input_dev.
	
	A simplified version of the semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression struct input_dev * x;
	expression ra,rr;
	position p1,p2;
	@@
	
	x = input_allocate_device@p1(...)
	...  when != x = rr
	     when != input_free_device(x,...)
	     when != if (...) { ... input_free_device(x,...) ...}
	if(...) { ... when != x = ra
	     when forall
	     when != input_free_device(x,...)
	 \(return <+...x...+>; \| return@p2...; \) }
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	cocci.print_main(\"input_allocate_device\",p1)
	cocci.print_secs(\"input_free_device\",p2)
	// </smpl>
	

iom/devm2i.cocci -  add missing iounmap

	Add missing iounmap in error handling code, in a case where the function
	already preforms iounmap on some other execution path.  This takes
	advantage of the iounmap already at the end of the function.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e;
	statement S,S1;
	int ret;
	@@
	e = \(ioremap\|ioremap_nocache\)(...)
	... when != iounmap(e)
	if (<+...e...+>) S
	... when any
	    when != iounmap(e)
	*if (...)
	   { ... when != iounmap(e)
	     return ...; }
	... when any
	iounmap(e);
	// </smpl>
	

iom/iom.cocci -  add missing iounmap

	Add missing iounmap in error handling code, in a case where the function
	already preforms iounmap on some other execution path.  This takes
	advantage of the iounmap already at the end of the function.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e;
	statement S,S1;
	int ret;
	@@
	e = \(ioremap\|ioremap_nocache\)(...)
	... when != iounmap(e)
	if (<+...e...+>) S
	... when any
	    when != iounmap(e)
	*if (...)
	   { ... when != iounmap(e)
	     return ...; }
	... when any
	iounmap(e);
	// </smpl>
	

iounmap/ioremap_check.cocci -  Added a missing iounmap

	----------------------------
	
	
	An extra error handling label is needed for the case where the ioremap has
	succeeded.
	
	The problem was detected using the following semantic match
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T,T1,T2;
	identifier E;
	statement S;
	expression x1,x2;
	constant C;
	int ret;
	@@
	
	  T E;
	  ...
	* E = ioremap(...);
	  if (E == NULL) S
	  ... when != iounmap(E)
	      when != if (E != NULL) { ... iounmap(E); ...}
	      when != x1 = (T1)E
	  if (...) {
	    ... when != iounmap(E)
	        when != if (E != NULL) { ... iounmap(E); ...}
	        when != x2 = (T2)E
	(
	*   return;
	|
	*   return C;
	|
	*   return ret;
	)
	  }
	// </smpl>
	

is_static/is_static.cocci -  Description not available

	Description not available

iserr/patch1.cocci -  simplify error handling

	----------------------------
	
	
	nf_conntrack_alloc cannot return NULL, so there is no need to check for
	NULL before using the value.  I have also removed the initialization of ct
	to NULL in nf_conntrack_alloc, since the value is never used, and since
	perhaps it might lead one to think that return ct at the end might return
	NULL.
	
	The semantic patch that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match exists@
	expression x, E;
	position p1,p2;
	statement S1, S2;
	@@
	
	x@p1 = nf_conntrack_alloc(...)
	... when != x = E
	(
	  if (x@p2 == NULL || ...) S1 else S2
	|
	  if (x@p2 == NULL && ...) S1 else S2
	)
	
	@other_match exists@
	expression match.x, E1, E2;
	position p1!=match.p1,match.p2;
	@@
	
	x@p1 = E1
	... when != x = E2
	x@p2
	
	@ script:python depends on !other_match@
	p1 << match.p1;
	p2 << match.p2;
	@@
	
	print \"%s: call to nf_conntrack_alloc %s bad test %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

iserr/patch2.cocci -  simplify error handling

	----------------------------
	
	
	nf_conntrack_alloc cannot return NULL, so there is no need to check for
	NULL before using the value.  I have also removed the initialization of ct
	to NULL in nf_conntrack_alloc, since the value is never used, and since
	perhaps it might lead one to think that return ct at the end might return
	NULL.
	
	The semantic patch that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match exists@
	expression x, E;
	position p1,p2;
	statement S1, S2;
	@@
	
	x@p1 = nf_conntrack_alloc(...)
	... when != x = E
	(
	  if (x@p2 == NULL || ...) S1 else S2
	|
	  if (x@p2 == NULL && ...) S1 else S2
	)
	
	@other_match exists@
	expression match.x, E1, E2;
	position p1!=match.p1,match.p2;
	@@
	
	x@p1 = E1
	... when != x = E2
	x@p2
	
	@ script:python depends on !other_match@
	p1 << match.p1;
	p2 << match.p2;
	@@
	
	print \"%s: call to nf_conntrack_alloc %s bad test %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

iserr/patch3.cocci -  simplify error handling

	----------------------------
	
	
	nf_conntrack_alloc cannot return NULL, so there is no need to check for
	NULL before using the value.  I have also removed the initialization of ct
	to NULL in nf_conntrack_alloc, since the value is never used, and since
	perhaps it might lead one to think that return ct at the end might return
	NULL.
	
	The semantic patch that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match exists@
	expression x, E;
	position p1,p2;
	statement S1, S2;
	@@
	
	x@p1 = nf_conntrack_alloc(...)
	... when != x = E
	(
	  if (x@p2 == NULL || ...) S1 else S2
	|
	  if (x@p2 == NULL && ...) S1 else S2
	)
	
	@other_match exists@
	expression match.x, E1, E2;
	position p1!=match.p1,match.p2;
	@@
	
	x@p1 = E1
	... when != x = E2
	x@p2
	
	@ script:python depends on !other_match@
	p1 << match.p1;
	p2 << match.p2;
	@@
	
	print \"%s: call to nf_conntrack_alloc %s bad test %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

iserr/patch45.cocci -  simplify error handling

	----------------------------
	
	
	nf_conntrack_alloc cannot return NULL, so there is no need to check for
	NULL before using the value.  I have also removed the initialization of ct
	to NULL in nf_conntrack_alloc, since the value is never used, and since
	perhaps it might lead one to think that return ct at the end might return
	NULL.
	
	The semantic patch that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match exists@
	expression x, E;
	position p1,p2;
	statement S1, S2;
	@@
	
	x@p1 = nf_conntrack_alloc(...)
	... when != x = E
	(
	  if (x@p2 == NULL || ...) S1 else S2
	|
	  if (x@p2 == NULL && ...) S1 else S2
	)
	
	@other_match exists@
	expression match.x, E1, E2;
	position p1!=match.p1,match.p2;
	@@
	
	x@p1 = E1
	... when != x = E2
	x@p2
	
	@ script:python depends on !other_match@
	p1 << match.p1;
	p2 << match.p2;
	@@
	
	print \"%s: call to nf_conntrack_alloc %s bad test %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

iserr/send_ct.cocci -  simplify error handling

	----------------------------
	
	
	nf_conntrack_alloc cannot return NULL, so there is no need to check for
	NULL before using the value.  I have also removed the initialization of ct
	to NULL in nf_conntrack_alloc, since the value is never used, and since
	perhaps it might lead one to think that return ct at the end might return
	NULL.
	
	The semantic patch that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match exists@
	expression x, E;
	position p1,p2;
	statement S1, S2;
	@@
	
	x@p1 = nf_conntrack_alloc(...)
	... when != x = E
	(
	  if (x@p2 == NULL || ...) S1 else S2
	|
	  if (x@p2 == NULL && ...) S1 else S2
	)
	
	@other_match exists@
	expression match.x, E1, E2;
	position p1!=match.p1,match.p2;
	@@
	
	x@p1 = E1
	... when != x = E2
	x@p2
	
	@ script:python depends on !other_match@
	p1 << match.p1;
	p2 << match.p2;
	@@
	
	print \"%s: call to nf_conntrack_alloc %s bad test %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

iserr_cata/category2a.cocci -  correct error-handling code

	----------------------------
	
	
	This code is not executed before file has been initialized to the result of
	calling eventfd_fget.  This function returns an ERR_PTR value in an error
	case instead of NULL.  Thus the test that file is not NULL is always true.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@match exists@
	expression x, E;
	statement S1, S2;
	@@
	
	x = eventfd_fget(...)
	... when != x = E
	(
	*  if (x == NULL || ...) S1 else S2
	|
	*  if (x == NULL && ...) S1 else S2
	)
	// </smpl>
	

iserr_ref/iserr_mini.cocci -  Move dereference to after IS_ERR test

	----------------------------
	
	
	If reply is ERR_PTR(...), then it should not be dereferenced, so I have
	moved the dereference from the declaration to after the IS_ERR test.
	
	The semantic match that finds the problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match exists@
	expression x, E;
	identifier fld;
	position p1,p2;
	@@
	
	(
	x = E;
	|
	x = E
	|
	x@p1->fld
	... when != x = E
	IS_ERR(x@p2)
	... when any
	)
	
	@other_match exists@
	expression match.x, E1, E2;
	position match.p1,match.p2;
	@@
	
	x = E1
	... when != x = E2
	    when != x@p1
	x@p2
	
	@ script:python depends on !other_match@
	p1 << match.p1;
	p2 << match.p2;
	@@
	
	print \"* file %s dereference %s test %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

iserr_ref/iserr_ref.cocci -  Move dereference to after IS_ERR test

	----------------------------
	
	
	If reply is ERR_PTR(...), then it should not be dereferenced, so I have
	moved the dereference from the declaration to after the IS_ERR test.
	
	The semantic match that finds the problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match exists@
	expression x, E;
	identifier fld;
	position p1,p2;
	@@
	
	(
	x = E;
	|
	x = E
	|
	x@p1->fld
	... when != x = E
	IS_ERR(x@p2)
	... when any
	)
	
	@other_match exists@
	expression match.x, E1, E2;
	position match.p1,match.p2;
	@@
	
	x = E1
	... when != x = E2
	    when != x@p1
	x@p2
	
	@ script:python depends on !other_match@
	p1 << match.p1;
	p2 << match.p2;
	@@
	
	print \"* file %s dereference %s test %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

iserreq/ise2.cocci -  Description not available

	Description not available

isnull_oct/isnull.cocci -  eliminate a null pointer dereference

	If ibss_wlan is NULL, it is not correct to memcpy into its field.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	expression E, E1;
	identifier f;
	statement S1,S2,S3;
	@@
	
	if (E == NULL)
	{
	  ... when != if (E == NULL || ...) S1 else S2
	      when != E = E1
	*E->f
	  ... when any
	  return ...;
	}
	else S3
	// </smpl>
	

isnullo/isnull.cocci -  keep pointer to resource so it can be freed

	Add a new variable for storing resources accessed subsequent to the one
	accessed using request_mem_region, so the one accessed using
	request_mem_region can be released if needed.
	
	The resource variable names are also changed to be more descriptive.
	
	This code is also missing some calls to iounmap.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	expression E, E1;
	identifier f;
	statement S1,S2,S3;
	@@
	
	if (E == NULL)
	{
	  ... when != if (E == NULL || ...) S1 else S2
	      when != E = E1
	*E->f
	  ... when any
	  return ...;
	}
	else S3
	// </smpl>
	

itnull/itnull.cocci -  Drop unnecessary null test

	----------------------------
	
	
	hlist_for_each_entry binds its first argument to a non-null value, and thus
	any null test on the value of that argument is superfluous.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	iterator I;
	expression x,E,E1,E2;
	statement S,S1,S2;
	@@
	
	I(x,...) { <...
	- (x != NULL) &&
	  E
	  ...> }
	// </smpl>
	

iwcontainer/extra_null.cocci -  Drop unnecessary NULL test

	----------------------------
	
	
	The result of container_of should not be NULL.  In particular, in this case
	the argument to the enclosing function has passed though INIT_WORK, which
	dereferences it, implying that its container cannot be NULL.
	
	A simplified version of the semantic patch that makes this change is as
	follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	identifier fn,work,x,fld;
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
	// </smpl>
	

jiffies/jiffies.cocci -  Subject:

	Send to:
	jgarzik@pobox.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject:
	[PATCH 20/38] drivers/net: Use time_before, time_before_eq, etc.
	
	
	------------------------------------------------------
	
	
	The functions time_before, time_before_eq, time_after, and time_after_eq
	are more robust for comparing jiffies against other values.
	
	A simplified version of the semantic patch making this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@ change_compare_np @
	expression E;
	@@
	
	(
	- jiffies <= E
	+ time_before_eq(jiffies,E)
	|
	- jiffies >= E
	+ time_after_eq(jiffies,E)
	|
	- jiffies < E
	+ time_before(jiffies,E)
	|
	- jiffies > E
	+ time_after(jiffies,E)
	)
	
	@ include depends on change_compare_np @
	@@
	
	#include <linux/jiffies.h>
	
	@ no_include depends on !include && change_compare_np @
	@@
	
	  #include <linux/...>
	+ #include <linux/jiffies.h>
	// </smpl>
	

k-zc-alloc/kzalloc.cocci -  Description not available

	Description not available

kasp/kasp.cocci -  Eliminate kstrdup memory leak

	The string clone is only used as a temporary copy of the argument val
	within the while loop, and so it should be freed before leaving the
	function.  The call to strsep, however, modifies clone, so a pointer to the
	front of the string is kept in saved_clone, to make it possible to free it.
	
	The sematic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E;
	identifier l;
	statement S;
	@@
	
	*x= \(kasprintf\|kstrdup\)(...);
	...
	if (x == NULL) S
	... when != kfree(x)
	    when != E = x
	if (...) {
	  <... when != kfree(x)
	* goto l;
	  ...>
	* return ...;
	}
	// </smpl>
	

kasprintf2/aspmem.cocci -  Use kstrdup

	Rewrite the initialization of a dev field.  In the original code, in each
	case there was a kmalloc followed by a memcpy, as illustrated by the
	semantic patch below.  In the case that the provided string was the empty
	string, the allocated memory was then overwritten with a constant string,
	causing a memory leak.  Finally, there was no provision for returning
	-ENOMEM in case of failure of the memory allocation.  Indeed, the return
	value in an error case was err, a variable that was never initialized to
	anything other than 0.
	
	The following patch rewrites the above code to first select a string based
	on various conditions, and then to copy it into a newly allocated memory
	region, using kstrdup.  This decreases subtantially the code size
	and removes the memory leak.  The instruction for getting the length of the
	string and the associated variable declaration are also deleted.
	
	The patch also drops err, changes the return value to retval, which in each
	file was already initialized elsewhere to an error code, and initializes
	retval to -ENOMEM when kstrdup fails.
	
	The semantic patch that motivated this transformation is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression a,flag,len;
	expression arg,e1,e2;
	statement S;
	@@
	
	  len = strlen(arg)
	  ... when != len = e1
	      when != arg = e2
	  a =
	-  \(kmalloc\|kzalloc\)(len+1,flag)
	+  kstrdup(arg,flag)
	  <... when != a
	  if (a == NULL || ...) S
	  ...>
	- memcpy(a,arg,len+1);
	// </smpl>
	

kc/kc.cocci -  Use kzalloc for allocating only one thing

	----------------------------
	
	
	Use kzalloc rather than kcalloc(1,...)
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	@@
	
	- kcalloc(1,
	+ kzalloc(
	          ...)
	// </smpl>
	

kfree3/kmalloc.cocci -  introduce missing kfree

	----------------------------
	
	
	Error handling code following a kmalloc should free the allocated data.
	
	The semantic match that finds the problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	statement S;
	expression E;
	identifier f,l;
	position p1,p2;
	expression *ptr != NULL;
	@@
	
	(
	if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) == NULL) S
	|
	x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
	...
	if (x == NULL) S
	)
	<... when != x
	     when != if (...) { <+...x...+> }
	x->f = E
	...>
	(
	 return \(0\|<+...x...+>\|ptr\);
	|
	 return@p2 ...;
	)
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	print \"* file: %s kmalloc %s return %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

kfree3/kmalloc8a.cocci -  introduce missing kfree

	----------------------------
	
	
	Error handling code following a kmalloc should free the allocated data.
	
	The semantic match that finds the problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	statement S;
	expression E;
	identifier f,l;
	position p1,p2;
	expression *ptr != NULL;
	@@
	
	(
	if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) == NULL) S
	|
	x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
	...
	if (x == NULL) S
	)
	<... when != x
	     when != if (...) { <+...x...+> }
	x->f = E
	...>
	(
	 return \(0\|<+...x...+>\|ptr\);
	|
	 return@p2 ...;
	)
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	print \"* file: %s kmalloc %s return %s\" % (p1[0].file,p1[0].line,p2[0].line)
	// </smpl>
	

kfree_after/kfree_after.cocci -  add missing kfree

	Clear the cx231xx_devused variable and free dev in the error handling code,
	as done in the error handling code nearby.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	identifier x;
	@@
	
	kfree(x)
	
	@@
	identifier r.x;
	expression E1!=0,E2,E3,E4;
	statement S;
	@@
	
	(
	if (<+...x...+>) S
	|
	if (...) { ... when != kfree(x)
	               when != if (...) { ... kfree(x); ... }
	               when != x = E3
	* return E1;
	}
	... when != x = E2
	if (...) { ... when != x = E4
	 kfree(x); ... return ...; }
	)
	// </smpl>
	

kfree_after2/kfree_after.cocci -  add missing kfree

	Adjust the goto to jump to the error handling code that includes kfree.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	identifier x;
	expression E1!=0,E2,E3,E4;
	statement S;
	iterator I;
	@@
	
	(
	if (...) { ... when != kfree(x)
	               when != x = E3
	               when != E3 = x
	*  return ...;
	 }
	... when != x = E2
	    when != I(...,x,...) S
	if (...) { ... when != x = E4
	 kfree(x); ... return ...; }
	)
	// </smpl>
	

kfree_skb/skbfree.cocci -  Convert kfree to kfree_skb

	Send to:
	marcel@holtmann.org, maxk@qualcomm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] drivers/bluetooth: Convert kfree to kfree_skb
	
	------------------------------------------------------
	
	
	kfree_skb rather than kfree should be used for values of type struct
	sk_buff *.
	
	This was fixed using the following semantic patch
	(http://www.emn.fr/x-info/coccinelle/).
	
	// <smpl>
	@@
	struct sk_buff *skb;
	@@
	
	- kfree(skb)
	+ kfree_skb(skb)
	// </smpl>
	

kfrees/kfree.cocci -  introduce missing kfree

	----------------------------
	
	
	The semantic match that finds the problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	@r exists@
	expression E,E1;
	statement S;
	position p1,p2,p3;
	@@
	
	E =@p1 \(kmalloc\|kcalloc\|kzalloc\)(...)
	... when != E = E1
	if (E == NULL || ...) S
	... when != E = E1
	if@p2 (...) {
	 ... when != kfree(E)
	 }
	... when != E = E1
	kfree@p3(E);
	
	@forall@
	position r.p2;
	expression r.E;
	int E1 != 0;
	@@
	
	* if@p2 (...) {
	 ... when != kfree(E)
	     when strict
	return E1; }
	
	

kmalloc9/kmalloc9.cocci -  add missing kfree

	At this point, window has not been stored anywhere, so it has to be freed
	before leaving the function.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@exists@
	local idexpression x;
	statement S,S1;
	expression E;
	identifier fl;
	expression *ptr != NULL;
	@@
	
	x = \(kmalloc\|kzalloc\|kcalloc\)(...);
	...
	if (x == NULL) S
	<... when != x
	     when != if (...) { <+...kfree(x)...+> }
	     when any
	     when != true x == NULL
	x->fl
	...>
	(
	if (x == NULL) S1
	|
	if (...) { ... when != x
	               when forall
	(
	 return \(0\|<+...x...+>\|ptr\);
	|
	* return ...;
	)
	}
	)
	// </smpl>
	

kmc1/kmc1.cocci -  free kmem_cache_zalloc'd data using kmem_cache_free

	Memory allocated using kmem_cache_zalloc should be freed using
	kmem_cache_free, not kfree.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,e,e1,e2;
	@@
	
	x = kmem_cache_zalloc(e1,e2)
	... when != x = e
	?-kfree(x)
	+kmem_cache_free(e1,x)
	// </smpl>
	

kmc1a/kmc1.cocci -  eliminate NULL pointer dereference

	In this code, blkvsc_req is allocated in the cache blkdev->request_pool,
	but freed in the first case to the cache blkvsc_req->dev->request_pool.
	blkvsc_req->dev is subsequently initialized to blkdev, making these the
	same at the second call to kmem_cache_free.  But at the point of the first
	call, blkvsc_req->dev is NULL.  The second call is changed too, for
	uniformity.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,e,e1,e2,e3;
	@@
	
	x = \(kmem_cache_alloc\|kmem_cache_zalloc\)(e1,e2)
	... when != x = e
	(
	kmem_cache_free(e1,x);
	|
	?-kmem_cache_free(e3,x);
	+kmem_cache_free(e1,x);
	)
	// </smpl>
	

kmtest/kmtest.cocci -  Add kmalloc NULL tests

	----------------------------
	
	
	Check that the result of kmalloc is not NULL before passing it to other
	functions.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression *x;
	identifier f;
	constant char *C;
	@@
	
	x = \(kmalloc\|kcalloc\|kzalloc\)(...);
	... when != x == NULL
	    when != x != NULL
	    when != (x || ...)
	(
	kfree(x)
	|
	f(...,C,...,x,...)
	|
	*f(...,x,...)
	|
	*x->f
	)
	// </smpl>
	

kstr/kstr.cocci -  use kstrtoul, etc

	Use kstrtoul, etc instead of the now deprecated strict_strtoul, etc.
	
	A semantic patch rule for the kstrtoul case is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression a,b;
	{int,long} *c;
	@@
	
	-strict_strtoul
	+kstrtoul
	 (a,b,c)
	// </smpl>
	

kstrdup/kstrdup.cocci -  Use kstrdup

	----------------------------
	
	
	Use kstrdup when the goal of an allocation is copy a string into the
	allocated region.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression from,to;
	expression flag,E1,E2;
	statement S;
	@@
	
	-  to = kmalloc(strlen(from) + 1,flag);
	+  to = kstrdup(from, flag);
	   ... when != \(from = E1 \| to = E1 \)
	   if (to==NULL || ...) S
	   ... when != \(from = E2 \| to = E2 \)
	-  strcpy(to, from);
	// </smpl>
	

lcd/category2b_back_device_reg.cocci -  Bad error test before a dereference

	----------------------------
	
	
	The error test that follows the call to backlight_device_register
	seems not to concern the right variable.
	
	A simplified version of the semantic match that finds this problem is
	as follows: 
	(http://www.emn.fr/x-info/coccinelle/)
	// <smpl>
	@def0@
	expression x;
	position p0;
	@@
	x@p0 = backlight_device_register(...)
	
	@protected@
	expression def0.x,E;
	position def0.p0;
	position p;
	statement S;
	@@
	x@p0
	... when != x = E
	if (!IS_ERR(x) && ...) {<... x@p ...>} else S
	
	@unprotected@
	expression def0.x;
	identifier fld;
	position def0.p0;
	position p != protected.p;
	@@
	x@p0
	... when != x = E
	* x@p->fld
	// </smpl>
	

lenull/lenull.cocci -  Drop NULL test on list_entry result

	----------------------------
	
	
	list_entry, which is an alias for container_of, cannot return NULL, as
	there is no way to add a NULL value to a doubly linked list.
	
	A simplified version of the semantic match that findds this problem is as
	follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r@
	expression x,E;
	statement S1,S2;
	position p,p1;
	@@
	
	*x = list_entry@p(...)
	... when != x = E
	*if@p1 (x == NULL) S1 else S2
	// </smpl>
	

leq/leq.cocci -  Description not available

	Description not available

lfee/lfee.cocci -  remove invalid reference to list iterator variable

	If list_for_each_entry, etc complete a traversal of the list, the iterator
	variable ends up pointing to an address at an offset from the list head,
	and not a meaningful structure.  Thus this value should not be used after
	the end of the iterator.
	
	A break is added after the switch; the break in the switch would jump out
	of the switch, but not out of the complete iteration.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	identifier c;
	expression E;
	iterator name list_for_each_entry;
	statement S;
	@@
	
	list_for_each_entry(c,...) { ... when != break;
	                                 when forall
	                                 when strict
	}
	...
	(
	c = E
	|
	*c
	)
	// </smpl>
	
	Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

list_entry/rcu2.cocci -  Description not available

	Description not available

list_entry_update/list_entry_update.cocci -  Eliminate update of list_for_each_entry loop cursor

	----------------------------
	
	
	list_for_each_entry uses its first argument to move from one element to the
	next, so modifying it can break the iteration.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	iterator name list_for_each_entry;
	expression x,E;
	position p1,p2;
	@@
	
	list_for_each_entry@p1(x,...) { <... x =@p2 E ...> }
	
	@@
	expression x,E;
	position r.p1,r.p2;
	statement S;
	@@
	
	*x =@p2 E
	...
	list_for_each_entry@p1(x,...) S
	// </smpl>
	

listfree/listfree.cocci -  Avoid leaving freed data in a list

	b may be added to a list, but is not removed before being freed in the case
	of an error.  This is done in the corresponding deallocation function, so
	the code here has been changed to follow that.
	
	The sematic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression E,E1,E2;
	identifier l;
	@@
	
	*list_add(&E->l,E1);
	... when != E1
	    when != list_del(&E->l)
	    when != list_del_init(&E->l)
	    when != E = E2
	*kfree(E);// </smpl>
	

local/local.cocci -  Add local_irq_restore in error handling code

	----------------------------
	
	
	There is a call to local_irq_restore in the normal exit case, so it would
	seem that there should be one on an error return as well.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression l;
	expression E,E1,E2;
	@@
	
	local_irq_save(l);
	... when != local_irq_restore(l)
	    when != spin_unlock_irqrestore(E,l)
	    when any
	    when strict
	(
	if (...) { ... when != local_irq_restore(l)
	               when != spin_unlock_irqrestore(E1,l)
	+   local_irq_restore(l);
	    return ...;
	}
	|
	if (...)
	+   {local_irq_restore(l);
	    return ...;
	+   }
	|
	spin_unlock_irqrestore(E2,l);
	|
	local_irq_restore(l);
	)
	// </smpl>
	

lock/o_lock_inconsistent.cocci -  Add missing unlock

	----------------------------
	
	
	Unlock the lock before leaving the function.
	
	A simplified version of the semantic patch that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	expression E1;
	identifier f;
	@@
	
	f (...) { <+...
	* spin_lock_irqsave (E1,...);
	... when != E1
	* return ...;
	...+> }
	// </smpl>
	

lock_flags/flags.cocci -  convert nested spin_lock_irqsave to spin_lock

	----------------------------
	
	
	If spin_lock_irqsave is called twice in a row with the same second
	argument, the interrupt state at the point of the second call overwrites
	the value saved by the first call.  Indeed, the second call does not need
	to save the interrupt state, so it is changed to a simple spin_lock.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression lock1,lock2;
	expression flags;
	@@
	
	*spin_lock_irqsave(lock1,flags)
	... when != flags
	*spin_lock_irqsave(lock2,flags)
	// </smpl>
	

lock_flags/flags1.cocci -  convert nested spin_lock_irqsave to spin_lock

	----------------------------
	
	
	If spin_lock_irqsave is called twice in a row with the same second
	argument, the interrupt state at the point of the second call overwrites
	the value saved by the first call.  Indeed, the second call does not need
	to save the interrupt state, so it is changed to a simple spin_lock.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression lock1,lock2;
	expression flags;
	@@
	
	*spin_lock_irqsave(lock1,flags)
	... when != flags
	*spin_lock_irqsave(lock2,flags)
	// </smpl>
	

map_destroy/map_destroy.cocci -  avoid calling map_destroy on NULL

	map_destroy dereferences its argument.  The call is furthermore only
	reachable when this argument is NULL.  Thus the call is dropped.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression *x;
	@@
	
	*if (x == NULL)
	{ ...
	* map_destroy(x);
	  ...
	  return ...;
	}
	// </smpl>
	

markbusy/usb_mark_last_busy.cocci -  Description not available

	Description not available

mem2/mem2.cocci -  drop redundant memset

	----------------------------
	
	
	The region set by the call to memset is immediately overwritten by the
	subsequent call to memcpy.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e1,e2,e3,e4;
	@@
	
	- memset(e1,e2,e3);
	  memcpy(e1,e4,e3);
	// </smpl>
	

memdup/memdup.cocci -  Use kmemdup

	----------------------------
	
	
	Use kmemdup when some other buffer is immediately copied into the
	allocated region.
	
	A simplified version of the semantic patch that makes this change is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression from,to,size,flag;
	statement S;
	@@
	
	-  to = \(kmalloc\|kzalloc\)(size,flag);
	+  to = kmemdup(from,size,flag);
	   if (to==NULL || ...) S
	-  memcpy(to, from, size);
	// </smpl>
	

memdup_user/memdup_user.cocci -  Use memdup_user

	----------------------------
	
	
	Use memdup_user when user data is immediately copied into the
	allocated region.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression from,to,size,flag;
	position p;
	identifier l1,l2;
	@@
	
	-  to = \(kmalloc@p\|kzalloc@p\)(size,flag);
	+  to = memdup_user(from,size);
	   if (
	-      to==NULL
	+      IS_ERR(to)
	                 || ...) {
	   <+... when != goto l1;
	-  -ENOMEM
	+  PTR_ERR(to)
	   ...+>
	   }
	-  if (copy_from_user(to, from, size) != 0) {
	-    <+... when != goto l2;
	-    -EFAULT
	-    ...+>
	-  }
	// </smpl>
	

memuser/memuser.cocci -  add missing kfree

	The label fail frees dev->buf, but kbuf hasn't yet been stored there at
	this point.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@exists@
	local idexpression x;
	statement S;
	expression E;
	expression *ptr != NULL;
	@@
	
	x = memdup_user(...);
	...
	if (IS_ERR(x)) S
	... when != x
	    when != x = E
	(
	 return \(0\|<+...x...+>\|ptr\);
	|
	*return ...;
	)
	// </smpl>
	

mesh/mesh.cocci -  correct the argument to __mesh_table_free

	----------------------------
	
	
	In the function mesh_table_grow, it is the new table not the argument table
	that should be freed if the function fails (cf commit
	bd9b448f4c0a514559bdae4ca18ca3e8cd999c6d)
	
	The semantic match that detects this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E,f;
	position p1,p2,p3;
	identifier l;
	statement S;
	@@
	
	x = mesh_table_alloc@p1(...)
	...
	if (x == NULL) S
	... when != E = x
	    when != mesh_table_free(x)
	goto@p2 l;
	... when != E = x
	    when != f(...,x,...)
	    when any
	(
	return \(0\|x\);
	|
	return@p3 ...;
	)
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	p3 << r.p3;
	@@
	
	print \"%s: call on line %s not freed or saved before return on line %s via line %s\" % (p1[0].file,p1[0].line,p3[0].line,p2[0].line)
	// </smpl>
	

mini_lock/mini_lock.cocci -  Add missing spin_unlock

	----------------------------
	
	
	Add a spin_unlock missing on the error path.  The locks and unlocks are
	balanced in other functions, so it seems that the same should be the case
	here.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression E1;
	@@
	
	* spin_lock(E1,...);
	  <+... when != E1
	  if (...) {
	    ... when != E1
	*   return ...;
	  }
	  ...+>
	* spin_unlock(E1,...);
	// </smpl>
	

mini_null/mini_null_ref.cocci -  Move a dereference below a NULL test

	----------------------------
	
	
	In each case, if the NULL test is necessary, then the dereference should be
	moved below the NULL test.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T;
	expression E;
	identifier i,fld;
	statement S;
	@@
	
	- T i = E->fld;
	+ T i;
	  ... when != E
	      when != i
	  if (E == NULL) S
	+ i = E->fld;
	// </smpl>
	

mini_null3/mini_null_ref3.cocci -  Move a dereference below a NULL test

	----------------------------
	
	
	If the NULL test is necessary, then the dereference should be moved below
	the NULL test.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/).
	
	// <smpl>
	@disable is_null@
	identifier f;
	expression E;
	identifier fld;
	statement S;
	@@
	
	+ if (E == NULL) S
	  f(...,E->fld,...);
	- if (E == NULL) S
	
	@@
	identifier f;
	expression E;
	identifier fld;
	statement S;
	@@
	
	+ if (!E) S
	  f(...,E->fld,...);
	- if (!E) S
	// </smpl>
	

mini_null_check/mini_null_check.cocci -  Move a dereference below a NULL test

	----------------------------
	
	
	If the NULL test is necessary, then the dereference should be moved below
	the NULL test.  I have additionally added a return if the NULL tests
	succeeds, because it is not clear that the rest of the function, which is
	for debugging only, makes sense in this case.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T;
	expression E,E1;
	identifier i,fld;
	statement S;
	@@
	
	- T i = E->fld;
	+ T i;
	  ... when != E=E1
	      when != i
	  if (E == NULL||...) S
	+ i = E->fld;
	// </smpl>
	

mini_null_check/second_mini_null_check.cocci -  Move a dereference below a NULL test

	----------------------------
	
	
	If the NULL test is necessary, then the dereference should be moved below
	the NULL test.  I have additionally added a return if the NULL tests
	succeeds, because it is not clear that the rest of the function, which is
	for debugging only, makes sense in this case.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T;
	expression E,E1;
	identifier i,fld;
	statement S;
	@@
	
	- T i = E->fld;
	+ T i;
	  ... when != E=E1
	      when != i
	  if (E == NULL||...) S
	+ i = E->fld;
	// </smpl>
	

mini_null_ref_aug10/mini_null_ref.cocci -  Remove potential NULL dereference

	If the NULL test is necessary, the initialization involving a dereference of
	the tested value should be moved after the NULL test.
	
	The sematic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	type T;
	expression E;
	identifier i,fld;
	statement S;
	@@
	
	- T i = E->fld;
	+ T i;
	  ... when != E
	      when != i
	  if (E == NULL) S
	+ i = E->fld;
	// </smpl>
	

mini_null_ref_aug14/mini_null_ref.cocci -  Remove potential NULL dereference

	If the NULL test is necessary, the initialization involving a dereference of
	the tested value should be moved after the NULL test.
	
	The sematic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	type T;
	expression E;
	identifier i,fld;
	statement S;
	@@
	
	- T i = E->fld;
	+ T i;
	  ... when != E
	      when != i
	  if (E == NULL) S
	+ i = E->fld;
	// </smpl>
	

misc_undo/send_m1.cocci -  Add missing pci_dev_put

	----------------------------
	
	
	pci_get_device increments a reference count that should be decremented
	using pci_dev_put.
	
	The semantic patch that finds the problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	statement S,S1;
	position p1,p2,p3;
	expression E,E1;
	type T,T1;
	expression *ptr != NULL;
	@@
	
	(
	 if ((x@p1 = pci_get_device(...)) == NULL) S
	|
	 x@p1 = pci_get_device(...);
	)
	 ... when != pci_dev_put(...,(T)x,...)
	     when != if (...) { <+... pci_dev_put(...,(T)x,...) ...+> }
	     when != true x == NULL || ...
	     when != x = E
	     when != E = (T)x
	     when any
	(
	 if (x == NULL || ...) S1
	|
	 if@p2 (...) {
	  ... when != pci_dev_put(...,(T1)x,...)
	      when != if (...) { <+... pci_dev_put(...,(T1)x,...) ...+> }
	      when != x = E1
	      when != E1 = (T1)x
	(
	  return \(0\|<+...x...+>\|ptr\);
	|
	  return@p3 ...;
	)
	}
	)
	
	@ script:python @
	p1 << r.p1;
	p3 << r.p3;
	@@
	
	print \"* file: %s pci_get_device: %s return: %s\" % (p1[0].file,p1[0].line,p3[0].line)
	// </smpl>
	

misc_undo/send_m2.cocci -  Add missing pci_dev_put

	----------------------------
	
	
	pci_get_device increments a reference count that should be decremented
	using pci_dev_put.
	
	The semantic patch that finds the problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	statement S,S1;
	position p1,p2,p3;
	expression E,E1;
	type T,T1;
	expression *ptr != NULL;
	@@
	
	(
	 if ((x@p1 = pci_get_device(...)) == NULL) S
	|
	 x@p1 = pci_get_device(...);
	)
	 ... when != pci_dev_put(...,(T)x,...)
	     when != if (...) { <+... pci_dev_put(...,(T)x,...) ...+> }
	     when != true x == NULL || ...
	     when != x = E
	     when != E = (T)x
	     when any
	(
	 if (x == NULL || ...) S1
	|
	 if@p2 (...) {
	  ... when != pci_dev_put(...,(T1)x,...)
	      when != if (...) { <+... pci_dev_put(...,(T1)x,...) ...+> }
	      when != x = E1
	      when != E1 = (T1)x
	(
	  return \(0\|<+...x...+>\|ptr\);
	|
	  return@p3 ...;
	)
	}
	)
	
	@ script:python @
	p1 << r.p1;
	p3 << r.p3;
	@@
	
	print \"* file: %s pci_get_device: %s return: %s\" % (p1[0].file,p1[0].line,p3[0].line)
	// </smpl>
	

missing_put/missing_put.cocci -  Add missing of_node_put

	Send to:
	benh@kernel.crashing.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 1/3] arch/powerpc: Add missing of_node_put
	
	------------------------------------------------------
	
	
	There should be an of_node_put when breaking out of a loop that iterates
	using for_each_node_by_type.
	
	This was detected and fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	identifier d;
	type T;
	expression e;
	iterator for_each_node_by_type;
	@@
	
	T *d;
	...
	for_each_node_by_type(d,...)
	  {... when != of_node_put(d)
	       when != e = d
	(
	   return d;
	|
	+  of_node_put(d);
	?  return ...;
	)
	...}
	// </smpl>
	

moduleparam/rule5.cocci -  Drop redundant includes of moduleparam.h

	Send to:
	dan@dennedy.org, stefanr@s5r6.in-berlin.de, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 2/4] drivers/ieee1394: Drop redundant includes of moduleparam.h
	
	
	------------------------------------------------------
	
	
	Drop #include <linux/moduleparam.h> in files that also include #include
	<linux/module.h>.  module.h includes moduleparam.h already.
	
	The semantic patch implementing this change is as follows:
	
	@ includesmodule @
	@@
	
	#include <linux/module.h>
	
	@ depends on includesmodule @
	@@
	
	- #include <linux/moduleparam.h>
	

more_of_noput/patch.cocci -  Add missing of_node_put

	arch/powerpc/platforms/pseries/reconfig.c
	
	Send to:
	paulus@au.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 1/3] arch/powerpc/platforms/pseries: Add missing of_node_put
	
	------------------------------------------------------
	
	
	Of_get_parent and of_find_compatible_node do an of_node_get, and thus a
	corresponding of_code_put is needed in the error case.
	
	
	The problem was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T,T1,T2;
	identifier E;
	statement S;
	expression x1,x2,x3;
	int ret;
	@@
	
	  T E;
	  ...
	* E = \(of_get_parent\|of_find_compatible_node\)(...);
	  if (E == NULL) S
	  ... when != of_node_put(...,(T1)E,...)
	      when != if (E != NULL) { ... of_node_put(...,(T1)E,...); ...}
	      when != x1 = (T1)E
	      when != E = x3;
	      when any
	  if (...) {
	    ... when != of_node_put(...,(T2)E,...)
	        when != if (E != NULL) { ... of_node_put(...,(T2)E,...); ...}
	        when != x2 = (T2)E
	(
	*   return;
	|
	*   return ret;
	)
	  }
	// </smpl>
	

more_pci/get_slot.cocci -  Add missing pci_dev_get

	drivers/char/agp/amd64-agp.c
	
	Send to:
	airlied@linux.ie, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] drivers/char/agp: Add missing pci_dev_get
	
	------------------------------------------------------
	
	
	pci_get_slot does a pci_dev_get, so pci_dev_put needs to be called in an
	error case
	
	The problem was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@exists@
	type T1,T2;
	identifier E;
	statement S,S1;
	expression x1,x2,x3;
	expression test;
	int ret != 0;
	@@
	
	  struct pci_dev *E;
	  ...
	(
	  E = \(pci_get_slot\|pci_get_device\|pci_get_bus_and_slot\)(...);
	  if (E == NULL) S
	|
	  if ((E = \(pci_get_slot\|pci_get_device\|pci_get_bus_and_slot\)(...)) == NULL) S
	)
	  ... when != pci_dev_put(...,(T1)E,...)
	      when != if (E != NULL) { ... pci_dev_put(...,(T1)E,...); ...}
	      when != x1 = (T1)E
	      when != E = x3;
	      when any
	(
	  if (E == NULL) S1
	|
	  if (test)
	+   {
	(
	+   pci_dev_put(E);
	    return;
	|
	+   pci_dev_put(E);
	    return ret;
	)
	+   }
	|
	  if (test) {
	    ... when != pci_dev_put(...,(T2)E,...)
	        when != if (E != NULL) { ... pci_dev_put(...,(T2)E,...); ...}
	        when != x2 = (T2)E
	(
	+   pci_dev_put(E);
	    return;
	|
	+   pci_dev_put(E);
	    return ret;
	)
	  }
	)
	// </smpl>
	

more_pci/more_pci.cocci -  Add missing pci_dev_get

	drivers/char/agp/amd64-agp.c
	
	Send to:
	airlied@linux.ie, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] drivers/char/agp: Add missing pci_dev_get
	
	------------------------------------------------------
	
	
	pci_get_slot does a pci_dev_get, so pci_dev_put needs to be called in an
	error case
	
	The problem was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@exists@
	type T1,T2;
	identifier E;
	statement S,S1;
	expression x1,x2,x3;
	expression test;
	int ret != 0;
	@@
	
	  struct pci_dev *E;
	  ...
	(
	  E = \(pci_get_slot\|pci_get_device\|pci_get_bus_and_slot\)(...);
	  if (E == NULL) S
	|
	  if ((E = \(pci_get_slot\|pci_get_device\|pci_get_bus_and_slot\)(...)) == NULL) S
	)
	  ... when != pci_dev_put(...,(T1)E,...)
	      when != if (E != NULL) { ... pci_dev_put(...,(T1)E,...); ...}
	      when != x1 = (T1)E
	      when != E = x3;
	      when any
	(
	  if (E == NULL) S1
	|
	  if (test)
	+   {
	(
	+   pci_dev_put(E);
	    return;
	|
	+   pci_dev_put(E);
	    return ret;
	)
	+   }
	|
	  if (test) {
	    ... when != pci_dev_put(...,(T2)E,...)
	        when != if (E != NULL) { ... pci_dev_put(...,(T2)E,...); ...}
	        when != x2 = (T2)E
	(
	+   pci_dev_put(E);
	    return;
	|
	+   pci_dev_put(E);
	    return ret;
	)
	  }
	)
	// </smpl>
	

mutex/mut.cocci -  Release mutex in error handling code

	----------------------------
	
	
	The mutex is released on a successful return, so it would seem that it
	should be released on an error return as well.
	
	The semantic patch finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression l;
	@@
	
	mutex_lock(l);
	... when != mutex_unlock(l)
	    when any
	    when strict
	(
	if (...) { ... when != mutex_unlock(l)
	+   mutex_unlock(l);
	    return ...;
	}
	|
	mutex_unlock(l);
	)
	// </smpl>
	

mutex2/mutex2.cocci -  Description not available

	Description not available

noderef/noderef.cocci -  

	

noderef2/noderef2.cocci -  Correct size given to memset

	----------------------------
	
	
	Memset should be given the size of the structure, not the size of the pointer.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	type T;
	T *x;
	expression E;
	@@
	
	memset(x, E, sizeof(
	+ *
	 x))
	// </smpl>
	

notnull/notnull.cocci -  Correct redundant test

	----------------------------
	
	
	bp was tested for NULL a few lines before, followed by a return, and there
	is no intervening modification of its value.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E;
	position p1,p2;
	@@
	
	if (x == NULL || ...) { ... when forall
	   return ...; }
	... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
	(
	*x == NULL
	|
	*x != NULL
	)
	// </smpl>
	

notnull/notnull2.cocci -  Correct redundant test

	----------------------------
	
	
	bp was tested for NULL a few lines before, followed by a return, and there
	is no intervening modification of its value.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E;
	position p1,p2;
	@@
	
	if (x == NULL || ...) { ... when forall
	   return ...; }
	... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
	(
	*x == NULL
	|
	*x != NULL
	)
	// </smpl>
	

null_ref/null_ref.cocci -  Move dereference after NULL test

	----------------------------
	
	
	If the NULL test on jack is needed, then the derefernce should be after the
	NULL test.
	
	A simplified version of the semantic match that detects this problem is as
	follows (http://coccinelle.lip6.fr/):
	
	// <smpl>
	@match exists@
	expression x, E;
	identifier fld;
	@@
	
	* x->fld
	  ... when != \(x = E\|&x\)
	* x == NULL
	// </smpl>
	

null_ref2/mini_null_ref2.cocci -  Adjust NULL test

	----------------------------
	
	
	Since ei is already known to be non-NULL, I assume that what was intended
	was to test the result of kzalloc.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E,E1;
	identifier f,fld,fld1;
	statement S1,S2;
	@@
	
	E->fld = f(...);
	... when != E = E1
	    when != E->fld1 = E1
	if (
	-   E
	+   E->fld
	           == NULL) S1 else S2
	// </smpl>
	

oddpe/oddpe.cocci -  adjust inconsistent IS_ERR and PTR_ERR

	Change the call to PTR_ERR to access the value just tested by IS_ERR.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e,e1;
	@@
	
	(
	if (IS_ERR(e)) { ... PTR_ERR(e) ... }
	|
	if (IS_ERR(e=e1)) { ... PTR_ERR(e) ... }
	|
	*if (IS_ERR(e))
	 { ...
	*  PTR_ERR(e1)
	   ... }
	)
	// </smpl>
	

of_noput/of_noput.cocci -  Add missing of_node_put

	Send to:
	olof@lixom.net, paulus@samba.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] arch/powerpc: Add missing of_node_put
	
	
	------------------------------------------------------
	
	
	There should be an of_node_put when breaking out of a loop that iterates
	over calls to of_find_all_nodes, as this function does an of_node_get on
	the value it returns.
	
	This was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T;
	identifier d;
	expression e;
	@@
	
	T *d;
	...
	for (d = NULL; (d = of_find_all_nodes(d)) != NULL; )
	 {... when != of_node_put(d)
	      when != e = d
	(
	   return d;
	|
	+  of_node_put(d);
	?  return ...;
	)
	...}
	// </smpl>
	

offset/offset.cocci -  Use offsetof

	Send to:
	tglx@linutronix.de, viro@ftp.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 1/3] arch/x86: Use offsetof
	
	
	------------------------------------------------------
	
	In the patch cc154ac64aa8d3396b187f64cef01ce67f433324, Al Viro observed
	that the proper way to compute the distance between two structure fields is
	to use offsetof() or a cast to a pointer to character.  The same change can
	be applied to a few more files.
	
	The change was made using the following semantic patch
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r@
	type T;
	T s;
	type T1, T2;
	identifier fld1, fld2;
	typedef uint8_t;
	typedef u8;
	@@
	
	(
	  (char *)&s.fld1 - (char *)&s.fld2
	|
	  (uint8_t *)&s.fld1 - (uint8_t *)&s.fld2
	|
	  (u8 *)&s.fld1 - (u8 *)&s.fld2
	|
	- (T1)&s.fld1 - (T2)&s.fld2
	+ offsetof(T,fld1) - offsetof(T,fld2)
	)
	// </smpl>
	

ofiomap/of_iomap-iounmap.cocci -  Add missing iounmap

	drivers/pcmcia/m8xx_pcmcia.c
	
	Send to:
	linux-pcmcia@lists.infradead.org, vbordug@ru.mvista.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] drivers/pcmcia: Add missing iounmap
	
	------------------------------------------------------
	
	
	of_iomap calls ioremap, and so should be matched with an iounmap.  At the
	two error returns, the result of calling of_iomap is only stored in a local
	variable, so these error paths need to call iounmap.  Furthermore, this
	function ultimately stores the result of of_iomap in an array that is local
	to the file.  These values should be iounmapped at some point.  I have
	added a corresponding call to iounmap at the end of the function m8xx_remove.
	
	
	
	The problem was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T,T1,T2;
	identifier E;
	statement S;
	expression x1,x2,x3;
	int ret;
	@@
	
	  T E;
	  ...
	* E = of_iomap(...);
	  if (E == NULL) S
	  ... when != iounmap(...,(T1)E,...)
	      when != if (E != NULL) { ... iounmap(...,(T1)E,...); ...}
	      when != x1 = (T1)E
	      when != E = x3;
	      when any
	  if (...) {
	    ... when != iounmap(...,(T2)E,...)
	        when != if (E != NULL) { ... iounmap(...,(T2)E,...); ...}
	        when != x2 = (T2)E
	(
	*   return;
	|
	*   return ret;
	)
	  }
	// </smpl>
	

ofnametype/ofname1.cocci -  add missing of_node_put

	----------------------------
	
	
	of_node_put is needed before discarding a value received from
	of_find_node_by_type, eg in error handling code.
	
	The semantic patch that makes the change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	struct device_node *n;
	struct device_node *n1;
	struct device_node *n2;
	statement S;
	identifier f1,f2;
	expression E1,E2;
	constant C;
	@@
	
	n = of_find_node_by_type(...)
	...
	if (!n) S
	... when != of_node_put(n)
	    when != n1 = f1(n,...)
	    when != E1 = n
	    when any
	    when strict
	(
	+ of_node_put(n);
	  return -C;
	|
	  of_node_put(n);
	|
	  n2 = f2(n,...)
	|
	  E2 = n
	|
	  return ...;
	)
	// </smpl>
	

ofnametype/oftype1.cocci -  add missing of_node_put

	----------------------------
	
	
	of_node_put is needed before discarding a value received from
	of_find_node_by_type, eg in error handling code.
	
	The semantic patch that makes the change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	struct device_node *n;
	struct device_node *n1;
	struct device_node *n2;
	statement S;
	identifier f1,f2;
	expression E1,E2;
	constant C;
	@@
	
	n = of_find_node_by_type(...)
	...
	if (!n) S
	... when != of_node_put(n)
	    when != n1 = f1(n,...)
	    when != E1 = n
	    when any
	    when strict
	(
	+ of_node_put(n);
	  return -C;
	|
	  of_node_put(n);
	|
	  n2 = f2(n,...)
	|
	  E2 = n
	|
	  return ...;
	)
	// </smpl>
	

ofnodeget/ofnodeget.cocci -  Add of_node_put to avoid memory leak

	Add a call to of_node_put in the error handling code following a call to
	of_find_node_by_path.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E,E1;
	statement S;
	@@
	
	*x = 
	(of_find_node_by_path
	|of_find_node_by_name
	|of_find_node_by_phandle
	|of_get_parent
	|of_get_next_parent
	|of_get_next_child
	|of_find_compatible_node
	|of_match_node
	)(...);
	...
	if (x == NULL) S
	<... when != x = E
	*if (...) {
	  ... when != of_node_put(x)
	      when != if (...) { ... of_node_put(x); ... }
	(
	  return <+...x...+>;
	|
	*  return ...;
	)
	}
	...>
	of_node_put(x);
	// </smpl>
	

ofnodeget/ofnodeget1.cocci -  Add of_node_put to avoid memory leak

	Add a call to of_node_put in the error handling code following a call to
	of_find_node_by_path.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E,E1;
	statement S;
	@@
	
	*x = 
	(of_find_node_by_path
	|of_find_node_by_name
	|of_find_node_by_phandle
	|of_get_parent
	|of_get_next_parent
	|of_get_next_child
	|of_find_compatible_node
	|of_match_node
	)(...);
	...
	if (x == NULL) S
	<... when != x = E
	*if (...) {
	  ... when != of_node_put(x)
	      when != if (...) { ... of_node_put(x); ... }
	(
	  return <+...x...+>;
	|
	*  return ...;
	)
	}
	...>
	of_node_put(x);
	// </smpl>
	

ofnodeget/ofnodeget2.cocci -  Add of_node_put to avoid memory leak

	Add a call to of_node_put in the error handling code following a call to
	of_find_node_by_path.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E,E1;
	statement S;
	@@
	
	*x = 
	(of_find_node_by_path
	|of_find_node_by_name
	|of_find_node_by_phandle
	|of_get_parent
	|of_get_next_parent
	|of_get_next_child
	|of_find_compatible_node
	|of_match_node
	)(...);
	...
	if (x == NULL) S
	<... when != x = E
	*if (...) {
	  ... when != of_node_put(x)
	      when != if (...) { ... of_node_put(x); ... }
	(
	  return <+...x...+>;
	|
	*  return ...;
	)
	}
	...>
	of_node_put(x);
	// </smpl>
	

ofnodeget3/ofnodeget3.cocci -  Add of_node_put to avoid memory leak

	This function is implemented as though the function of_get_next_child does
	not increment the reference count of its result, but actually it does.
	Thus the patch adds of_node_put in error handling code and drops a call to
	of_node_get.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	local idexpression x;
	expression E1;
	position p1,p2;
	@@
	
	x@p1 = of_get_next_child(...);
	... when != x = E1
	of_node_get@p2(x)
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	
	cocci.print_main(\"call\",p1)
	cocci.print_secs(\"get\",p2)
	// </smpl>
	

ofnodeget4/ofnodeget4.cocci -  Add of_node_put to avoid memory leak

	In this case, a device_node structure is stored in another structure that
	is then freed without first decrementing the reference count of the
	device_node structure.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	expression x;
	identifier f;
	position p1,p2;
	@@
	
	x@p1->f = \(of_find_node_by_path\|of_find_node_by_name\|of_find_node_by_phandle\|of_get_parent\|of_get_next_parent\|of_get_next_child\|of_find_compatible_node\|of_match_node\|of_find_node_by_type\|of_find_node_with_property\|of_find_matching_node\|of_parse_phandle\|of_node_get\)(...);
	... when != of_node_put(x)
	kfree@p2(x)
	
	@script:python@
	p1 << r.p1;
	p2 << r.p2;
	@@
	cocci.print_main(\"call\",p1)
	cocci.print_secs(\"free\",p2)
	// </smpl>
	

ofredef/ofredef.cocci -  add missing of_node_put

	np is initialized to the result of calling a function that calls
	of_node_get, so of_node_put should be called before the pointer is dropped.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e,e1,e2;
	@@
	
	* e = \(of_find_node_by_type\|of_find_node_by_name\)(...)
	  ... when != of_node_put(e)
	      when != true e == NULL
	      when != e2 = e
	  e = e1
	// </smpl>
	

osdi_isnull/osdi_isnull.cocci -  Eliminate a NULL pointer dereference

	----------------------------
	
	
	At the point of the print, dev is NULL.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	expression E,E1;
	identifier f;
	statement S1,S2,S3;
	@@
	
	if ((E == NULL && ...) || ...)
	{
	  ... when != if (...) S1 else S2
	      when != E = E1
	* E->f
	  ... when any
	  return ...;
	}
	else S3
	// </smpl>
	

osdi_isnull/osdi_isnull3.cocci -  Eliminate a NULL pointer dereference

	----------------------------
	
	
	At the point of the print, dev is NULL.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	expression E,E1;
	identifier f;
	statement S1,S2,S3;
	@@
	
	if ((E == NULL && ...) || ...)
	{
	  ... when != if (...) S1 else S2
	      when != E = E1
	* E->f
	  ... when any
	  return ...;
	}
	else S3
	// </smpl>
	

osdi_kfree/osdi_kfree.cocci -  Eliminate use after free

	----------------------------
	
	
	In each case, the first argument to send_control_msg or __send_control_msg,
	respectively, has either not been successfully allocated or has been freed
	at the point of the call.  In the first case, the first argument, port, is
	only used to access the portdev and id fields, in order to call
	__send_control_msg.  Thus it seems possible instead to call
	__send_control_msg directly.  In the second case, the call to
	__send_control_msg is moved up to a place where it seems like the first
	argument, portdev, has been initialized sufficiently to make the call to
	__send_control_msg meaningful.
	
	This has only been compile tested.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@free@
	expression E;
	position p;
	@@
	kfree@p(E)
	
	@@
	expression free.E, subE<=free.E, E1;
	position free.p;
	@@
	
	  kfree@p(E)
	  ...
	(
	  subE = E1
	|
	* E
	)
	// </smpl>
	

parport/sp8188.cocci -  Put gotten port value

	parport_find_number calls parport_get_port on its result, so there should
	be a corresponding call to parport_put_port before dropping the reference.
	Similar code is found in the function register_device in the same file.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@exists@
	local idexpression struct parport * x;
	expression ra,rr;
	statement S1,S2;
	@@
	
	x = parport_find_number(...)
	... when != x = rr
	    when any
	    when != parport_put_port(x,...)
	    when != if (...) { ... parport_put_port(x,...) ...}
	(
	if(<+...x...+>) S1 else S2
	|
	if(...) { ... when != x = ra
	     when forall
	     when != parport_put_port(x,...)
	*return...;
	}
	)
	// </smpl>
	

parse_phandle/parse_phandle.cocci -  add missing of_node_put

	of_parse_phandle increments the reference count of np, so this should be
	decremented before trying the next possibility.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e,e1,e2;
	@@
	
	*e = of_parse_phandle(...)
	... when != of_node_put(e)
	    when != true e == NULL
	    when != e2 = e
	e = e1
	// </smpl>
	

pci_add_put/pci_noputm.cocci -  Add missing pci_dev_put

	Send to:
	davem@davemloft.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 1/5] arch/sparc64: Add missing pci_dev_put
	
	
	------------------------------------------------------
	
	
	There should be a pci_dev_put when breaking out of a loop that iterates
	over calls to pci_get_device and similar functions.
	
	This was fixed using the following semantic patch.
	
	// <smpl>
	@@
	type T;
	identifier d;
	expression e;
	@@
	
	T *d;
	...
	while ((d = \(pci_get_device\|pci_get_device_reverse\|pci_get_subsys\|pci_get_class\)(..., d)) != NULL)
	 {... when != pci_dev_put(d)
	      when != e = d
	(
	   return d;
	|
	+  pci_dev_put(d);
	?  return ...;
	)
	...}
	// </smpl>
	

pci_drop_put/pci_get.cocci -  Description not available

	Description not available

pciom/pciom3.cocci -  exchange pci_iounmaps

	The calls to pci_iounmap are in the wrong order, as compared to the
	associated calls to pci_iomap.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e,x;
	statement S,S1;
	int ret;
	@@
	e = pci_iomap(x,...)
	... when != pci_iounmap(x,e)
	if (<+...e...+>) S
	... when any
	    when != pci_iounmap(x,e)
	*if (...)
	   { ... when != pci_iounmap(x,e)
	     return ...; }
	... when any
	pci_iounmap(x,e);
	// </smpl>
	

pd/pd.cocci -  Invert calls to platform_device_put and platform_device_del

	Platform_device_del should be called before platform_device_put, as
	platform_device_put can delete the structure.
	
	Additionally, improve the error handling code for the call to ioremap, so
	that it calls platform_device_put.
	
	The semantic match that finds this problem is:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e1,e2;
	@@
	
	*platform_device_put(e1);
	... when != e1 = e2
	*platform_device_del(e1);
	// </smpl>
	

platret/platret.cocci -  failure test for null rather than negative integer

	dev_get_platdata returns a pointer, so the failure value would be NULL
	rather than a negative integer.
	
	The semantic match that finds this problem is: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,e;
	statement S1,S2;
	@@
	
	*x = dev_get_platdata(...)
	... when != x = e
	*if (x < 0) S1 else S2
	// </smpl>
	

pointless_err/pointless_err.cocci -  Use ERR_CAST

	----------------------------
	
	
	Use ERR_CAST(x) rather than ERR_PTR(PTR_ERR(x)).  The former makes more
	clear what is the purpose of the operation, which otherwise looks like a
	no-op.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	type T;
	T x;
	identifier f;
	@@
	
	T f (...) { <+...
	- ERR_PTR(PTR_ERR(x))
	+ x
	 ...+> }
	
	@@
	expression x;
	@@
	
	- ERR_PTR(PTR_ERR(x))
	+ ERR_CAST(x)
	// </smpl>
	

prepare2/prepare2.cocci -  use clk_prepare_enable and clk_disable_unprepare

	Clk_prepare_enable and clk_disable_unprepare combine clk_prepare and
	clk_enable, and clk_disable and clk_unprepare.  They make the code more
	concise, and ensure that clk_unprepare is called when clk_enable fails.
	
	A simplified version of the semantic patch that introduces calls to these
	functions is as follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression e;
	@@
	
	- clk_prepare(e);
	- clk_enable(e);
	+ clk_prepare_enable(e);
	
	@@
	expression e;
	@@
	
	- clk_disable(e);
	- clk_unprepare(e);
	+ clk_disable_unprepare(e);
	// </smpl>
	

ptr/ptr.cocci -  Correct error handling code

	----------------------------
	
	
	If it is reasonable to apply PTR_ERR to the result of calling clk_get, then
	that result should first be tested with IS_ERR, not with !.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E,E1;
	@@
	
	if (
	-   E == NULL
	+   IS_ERR(E)
	   ) { <+... when != E = E1
	        PTR_ERR(E)
	       ...+> }
	// </smpl>
	

put_after/put_after.cocci -  add missing of_node_put

	dma_channel_np has been accessed at this point, so decrease its reference
	count before leaving the function.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	identifier x;
	expression E1!=0,E2,E3,E4;
	statement S;
	iterator I;
	@@
	
	(
	if (...) { ... when != of_node_put(x)
	               when != x = E3
	               when != E3 = x
	*  return ...;
	 }
	... when != x = E2
	    when != I(...,x,...) S
	if (...) { ... when != x = E4
	 of_node_put(x); ... return ...; }
	)
	// </smpl>
	

put_deref/patch.cocci -  move of_node_put

	----------------------------
	
	
	It seems better to dereference master before decrementing the reference
	count rather than afterwards.
	
	The problem was found using the following semantic match:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@
	expression n,E;
	identifier fld;
	iterator I;
	statement S;
	@@
	
	* of_node_put(n)
	... when != n = E
	    when != I(n,...) S
	* n->fld
	// </smpl>
	

putty/putty.cocci -  avoid calling put_tty_driver on NULL

	put_tty_driver calls tty_driver_kref_put on its argument, and then
	tty_driver_kref_put calls kref_put on the address of a field of this
	argument.  kref_put checks for NULL, but in this case the field is likely
	to have some offset and so the result of taking its address will not be
	NULL.  Labels are added to be able to skip over the call to put_tty_driver
	when the argument will be NULL.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression *x;
	@@
	
	*if (x == NULL)
	{ ...
	* put_tty_driver(x);
	  ...
	  return ...;
	}
	// </smpl>
	

rcu/rcu.cocci -  call rcu_read_unlock in default case

	----------------------------
	
	
	Adjust the default case so that it benefits from the call to rcu_read_unlock.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@rcu@
	position p1;
	@@
	
	rcu_read_lock@p1();
	...
	rcu_read_unlock();
	
	@@
	position rcu.p1;
	@@
	
	*rcu_read_lock@p1();
	... when != rcu_read_unlock();
	// </smpl>
	

reiserfs/category2a_open_xa_dir.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function open_xa_dir returns an ERR pointer,
	but never returns a NULL pointer. So a NULL test that comes after an
	IS_ERR test should be deleted.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x = open_xa_dir(...)
	... when != x = E
	(
	*  if (x == NULL && ...) S1 else S2
	|
	*  if (x == NULL || ...) S1 else S2
	)
	// </smpl>
	

remap_bar/remap_bar.cocci -  reorder error handling code to include iounmap

	The out_msi_disable label should be before cleanup_nomem to additionally
	benefit from the call to iounmap.  Subsequent gotos are adjusted to go to
	out_msi_disable instead of cleanup_nomem, which now follows it.  This is
	safe because pci_disable_msi does nothing if pci_enable_msi was not called.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	expression e1,e2;
	statement S;
	@@
	
	e1 = pci_ioremap_bar(...);
	... when != e1 = e2
	    when != iounmap(e1)
	    when any
	(
	 if (<+...e1...+>) S
	|
	 if(...) { ... return 0; }
	|
	 if (...) { ... when != iounmap(e1)
	                when != if (...) { ... iounmap(e1) ... }
	* return ...;
	 } else S
	)
	// </smpl>
	

remove/remove.cocci -  Drop return value from platform_driver remove functions

	----------------------------
	
	
	The return value of the remove function of a driver structure, and thus of
	a platform_driver structure, is ultimately ignored, and is thus
	unnecessary.  This patch removes the return value for the remove function
	stored in a platform_driver structure.  For the files in this patch, the
	return values are always 0.
	
	A simplified version of the semantic patch that makes this change is as
	follows: (http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r@
	struct platform_driver I;
	identifier a,f;
	position p;
	@@
	I.remove = \(f@p\|a(f@p)\);
	
	@void_called@
	identifier r.f;
	position p;
	@@
	f@p(...);
	
	@called@
	identifier r.f;
	position p1 != void_called.p;
	@@
	f@p1(...)
	
	@localfn@
	identifier r.f;
	@@
	static int f(...) { ... }
	
	@depends on !called && localfn@
	struct platform_driver I;
	identifier a,f;
	position r.p;
	@@
	
	I.
	- remove
	+ remove_new
	   = \(f@p\|a(f@p)\);
	
	@depends on !called && localfn@
	identifier r.f,i;
	constant C;
	expression E;
	@@
	
	- int
	+ void
	       f(...) {
	  <...
	(
	-  return \(C\|i\);
	+  return;
	|
	-  return E;
	+  E;
	+  return;
	)
	  ...>
	}
	// </smpl>
	

reqrel2/reqrel2.cocci -  Use release_mem_region after request_mem_region

	The memory allocated using request_mem_region should be released using
	release_mem_region, not release_region.
	
	The semantic patch that fixes part of this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression E1,E2,E3;
	@@
	
	request_mem_region(E1,E2,E3)
	...
	?- release_region(E1,E2)
	+ release_mem_region(E1,E2)
	// </smpl>
	

requests/diou.cocci -  fix usage of devm functions

	Fix some problems with the use of devm_ functions.
	
	devm_kzalloc: devm_kfree is not needed
	
	devm_ioremap: iounmap should not be used, no free is needed
	
	devm_request_irq: the devm_free_irq is followed by irq_dispose_mapping.  I
	don't know if it is safe to move the freeing of the irq in this case, so I
	have just un-devm'd this function, since the implicit freeing is never
	taken advantage of.
	
	In the original code failure of of_address_to_resource jumped to free_mem,
	but should have jumped to irq_dispose, since irq_of_parse_and_map has
	completed at this point.
	
	In the original code unmap_mem was after irq_dispose, but it should have
	been before, again since irq_of_parse_and_map has completed at this point.
	
	One of these problems was found using the following semantic match:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x;
	@@
	
	*x = devm_ioremap(...)
	...
	iounmap(x);
	// </smpl>
	

requests/dirq.cocci -  fix usage of devm functions

	Fix some problems with the use of devm_ functions.
	
	devm_kzalloc: devm_kfree is not needed
	
	devm_ioremap: iounmap should not be used, no free is needed
	
	devm_request_irq: the devm_free_irq is followed by irq_dispose_mapping.  I
	don't know if it is safe to move the freeing of the irq in this case, so I
	have just un-devm'd this function, since the implicit freeing is never
	taken advantage of.
	
	In the original code failure of of_address_to_resource jumped to free_mem,
	but should have jumped to irq_dispose, since irq_of_parse_and_map has
	completed at this point.
	
	In the original code unmap_mem was after irq_dispose, but it should have
	been before, again since irq_of_parse_and_map has completed at this point.
	
	One of these problems was found using the following semantic match:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x;
	@@
	
	*x = devm_ioremap(...)
	...
	iounmap(x);
	// </smpl>
	

resource/reg.cocci -  Convert release_resource to release_region/release_mem_region

	Request_region should be used with release_region, not release_resource.
	
	The result of request_mem_region is no longer stored.  Instead the field
	ioarea is used to store a pointer to the resource structure that contains
	the start address.  This is the information that is needed later in
	i2c_au1550_remove to release the region.  The field ioarea is not used for
	anything else.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,E;
	@@
	(
	*x = request_region(...)
	|
	*x = request_mem_region(...)
	)
	... when != release_region(x)
	    when != x = E
	* release_resource(x);
	// </smpl>
	

resource/resource.cocci -  Convert release_resource to release_region/release_mem_region

	Request_region should be used with release_region, not release_resource.
	
	The result of request_mem_region is no longer stored.  Instead the field
	ioarea is used to store a pointer to the resource structure that contains
	the start address.  This is the information that is needed later in
	i2c_au1550_remove to release the region.  The field ioarea is not used for
	anything else.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,E;
	@@
	(
	*x = request_region(...)
	|
	*x = request_mem_region(...)
	)
	... when != release_region(x)
	    when != x = E
	* release_resource(x);
	// </smpl>
	

resource_fix1/resource_fix1.cocci -  Convert release_resource to release_mem_region

	Request_mem_region should be used with release_mem_region, not
	release_resource.
	
	A semantic patch that partially fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@b@
	expression x,E;
	@@
	
	x = request_mem_region(x->start,...)
	... when != release_mem_region(x->start,...)
	    when != x = E
	(
	- release_resource(x);
	- kfree(x);
	+  release_mem_region(x->start,resource_size(x));
	|
	?- release_resource(x);
	+  release_mem_region(x->start,resource_size(x));
	)
	// </smpl>
	

resource_size/resource_size.cocci -  Use resource_size

	----------------------------
	
	
	Use the function resource_size, which reduces the chance of introducing
	off-by-one errors in calculating the resource size.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	struct resource *res;
	@@
	
	- (res->end - res->start) + 1
	+ resource_size(res)
	// </smpl>
	

ret3/ret3.cocci -  fix error return code

	Convert a nonnegative error return code to a negative one, as returned
	elsewhere in the function.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	identifier ret;
	expression e1,e2;
	@@
	
	if (ret < 0)
	 { ... return ret; }
	 ... when != ret = e1
	     when forall
	*if(...)
	 {
	  ... when != ret = e2
	* return ret;
	 }
	// </smpl>
	

ret4/ret4.cocci -  fix error return code

	Initialize return variable before exiting on an error path.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	(
	if@p1 (\(ret < 0\|ret != 0\))
	 { ... return ret; }
	|
	ret@p1 = 0
	)
	... when != ret = e1
	    when != &ret
	*if(...)
	{
	  ... when != ret = e2
	      when forall
	 return ret;
	}
	
	// </smpl>
	

retalloc/retalloc.cocci -  fix error return code

	Convert a 0 error return code to a negative one, as returned elsewhere in the
	function.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	identifier ret;
	expression e,e1,e2,e3,e4,x;
	@@
	
	(
	if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
	|
	ret = 0
	)
	... when != ret = e1
	*x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
	... when != x = e2
	    when != ret = e3
	*if (x == NULL || ...)
	{
	  ... when != ret = e4
	*  return ret;
	}
	// </smpl>
	

rirqp/rirqp.cocci -  ensure arguments to request_irq and free_irq are compatible

	Change 0 to NULL in the last argument of request_irq, since the argument
	should have pointer type and so that the last argument of request_irq
	syntactically matches the second argument of the later call to free_irq.
	

round/round.cocci -  Use DIV_ROUND_UP

	----------------------------
	
	
	The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) - 1) /
	(d)) but is perhaps more readable.
	
	An extract of the semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@haskernel@
	@@
	
	#include <linux/kernel.h>
	
	@depends on haskernel@
	expression n,d;
	@@
	
	(
	- (n + d - 1) / d
	+ DIV_ROUND_UP(n,d)
	|
	- (n + (d - 1)) / d
	+ DIV_ROUND_UP(n,d)
	)
	
	@depends on haskernel@
	expression n,d;
	@@
	
	- DIV_ROUND_UP((n),d)
	+ DIV_ROUND_UP(n,d)
	
	@depends on haskernel@
	expression n,d;
	@@
	
	- DIV_ROUND_UP(n,(d))
	+ DIV_ROUND_UP(n,d)
	// </smpl>
	

round2/round.cocci -  Use DIV_ROUND_UP

	----------------------------
	
	
	The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) - 1) /
	(d)) but is perhaps more readable.
	
	In the case of the file drivers/atm/eni.c, I am a little bit suspicious of
	the -1 at the end of the affected expression.  Please check that that is
	what is wanted.
	
	An extract of the semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@haskernel@
	@@
	
	#include <linux/kernel.h>
	
	@depends on haskernel@
	expression n,d;
	@@
	
	(
	- (n + d - 1) / d
	+ DIV_ROUND_UP(n,d)
	|
	- (n + (d - 1)) / d
	+ DIV_ROUND_UP(n,d)
	)
	
	@depends on haskernel@
	expression n,d;
	@@
	
	- DIV_ROUND_UP((n),d)
	+ DIV_ROUND_UP(n,d)
	
	@depends on haskernel@
	expression n,d;
	@@
	
	- DIV_ROUND_UP(n,(d))
	+ DIV_ROUND_UP(n,d)
	// </smpl>
	

round_closest/round_closest.cocci -  Use DIV_ROUND_CLOSEST

	----------------------------
	
	
	The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
	but is perhaps more readable.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@haskernel@
	@@
	
	#include <linux/kernel.h>
	
	@depends on haskernel@
	expression x,__divisor;
	@@
	
	- (((x) + ((__divisor) / 2)) / (__divisor))
	+ DIV_ROUND_CLOSEST(x,__divisor)
	// </smpl>
	

rr/rr.cocci -  Correct use of request_region/request_mem_region

	----------------------------
	
	
	request_mem_region should be used when ioremap is used subsequently.
	release_region is then correspondingly replaced by release_mem_region.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	expression start,E;
	@@
	
	- request_region
	+ request_mem_region
	  (start,...)
	... when != request_mem_region(start,...)
	    when != start = E
	ioremap(start,...)
	
	@@
	expression r.start;
	@@
	
	- release_region
	+ release_mem_region
	  (start,...)
	// </smpl>
	

rr/rr1.cocci -  Correct use of request_region/request_mem_region

	----------------------------
	
	
	request_mem_region should be used when ioremap is used subsequently.
	release_region is then correspondingly replaced by release_mem_region.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	expression start,E;
	@@
	
	- request_region
	+ request_mem_region
	  (start,...)
	... when != request_mem_region(start,...)
	    when != start = E
	ioremap(start,...)
	
	@@
	expression r.start;
	@@
	
	- release_region
	+ release_mem_region
	  (start,...)
	// </smpl>
	

rxrpc/category2a_rxrpc_get_transport.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function rxrpc_get_transport returns an ERR
	pointer, but never returns a NULL pointer. So after a call to this
	function, a NULL test should be replaced by an IS_ERR test.
	
	A simplified version of the semantic patch that makes this change is
	as follows: 
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@correct_null_test@
	expression x,E;
	statement S1, S2;
	@@
	x =  rxrpc_get_transport(...)
	<... when != x = E
	if (
	(
	- x@p2 != NULL
	+ ! IS_ERR ( x )
	|
	- x@p2 == NULL
	+ IS_ERR( x )
	)
	 )
	S1
	else S2
	...>
	? x = E;
	// </smpl>
	

s390/category2a_dasd_kmalloc_request.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, functions dasd_kmalloc_request and idal_buffer_alloc
	return an ERR pointer, but never return the NULL pointer. So after a
	call to one of these functions, a NULL test should be replaced by an
	IS_ERR test.
	
	A simplified version of the semantic patch that makes this change is
	as follows: 
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@correct_null_test@
	expression x,E;
	statement S1, S2;
	@@
	x = 
	(
	  dasd_kmalloc_request(...)
	|
	  idal_buffer_alloc(...)
	)
	<... when != x = E
	if (
	(
	- x@p2 != NULL
	+ ! IS_ERR ( x )
	|
	- x@p2 == NULL
	+ IS_ERR( x )
	)
	 )
	S1
	else S2
	...>
	? x = E;
	// </smpl>
	

s390/category2a_idal_buffer_alloc.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, functions dasd_kmalloc_request and idal_buffer_alloc
	return an ERR pointer, but never return the NULL pointer. So after a
	call to one of these functions, a NULL test should be replaced by an
	IS_ERR test.
	
	A simplified version of the semantic patch that makes this change is
	as follows: 
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@correct_null_test@
	expression x,E;
	statement S1, S2;
	@@
	x = 
	(
	  dasd_kmalloc_request(...)
	|
	  idal_buffer_alloc(...)
	)
	<... when != x = E
	if (
	(
	- x@p2 != NULL
	+ ! IS_ERR ( x )
	|
	- x@p2 == NULL
	+ IS_ERR( x )
	)
	 )
	S1
	else S2
	...>
	? x = E;
	// </smpl>
	

s390/s390.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, functions dasd_kmalloc_request and idal_buffer_alloc
	return an ERR pointer, but never return the NULL pointer. So after a
	call to one of these functions, a NULL test should be replaced by an
	IS_ERR test.
	
	A simplified version of the semantic patch that makes this change is
	as follows: 
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@correct_null_test@
	expression x,E;
	statement S1, S2;
	@@
	x = 
	(
	  dasd_kmalloc_request(...)
	|
	  idal_buffer_alloc(...)
	)
	<... when != x = E
	if (
	(
	- x@p2 != NULL
	+ ! IS_ERR ( x )
	|
	- x@p2 == NULL
	+ IS_ERR( x )
	)
	 )
	S1
	else S2
	...>
	? x = E;
	// </smpl>
	

samba_free/samba.cocci -  Description not available

	Description not available

semicolon/semicolon.cocci -  removes unnecessary semicolon

	removes unnecessary semicolon
	
	Found by Coccinelle: http://coccinelle.lip6.fr/
	

serial_core/serial_core.cocci -  Use UPIO_MEM rather than SERIAL_IO_MEM

	----------------------------
	
	
	As in the commit 9b4a1617772d6d5ab5eeda0cd95302fae119e359, use UPIO_MEM
	rather than SERIAL_IO_MEM.  Both have the same value.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@has_sc@
	@@
	
	#include <linux/serial_core.h>
	
	@depends on has_sc@
	@@
	
	- SERIAL_IO_MEM
	+ UPIO_MEM
	// </smpl>
	

signed/signed.cocci -  use unsigned for loop index

	----------------------------
	
	
	A few more cases in the spirit of the patch \"Trivial: Replacement of always
	>0 ints with unsigned ints\" submitted by Ricardo Martins <ricardo@scarybox.net>
	
	The transformation was made using the following semantic patch
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r exists@ // find anything that might decrement the variable
	identifier i;
	expression E;
	position p;
	@@
	
	  int i@p;
	  ...
	(
	  &i
	|
	  i--
	|
	  --i
	|
	  i-=E
	|
	  i+=E
	)
	
	@x disable decl_init@
	identifier r.i;
	expression E;
	position p1 != r.p;
	@@
	
	(
	  volatile int i = 0;
	|
	  volatile int i;
	|
	+ unsigned
	  int i@p1 = 0;
	|
	+ unsigned
	  int i@p1;
	)
	  <... when != i = E      
	(
	  i = 0
	|
	  i = 1
	)
	  ...>
	// </smpl>
	

simple_kzalloc/simple_kzalloc1.cocci -  Use kzalloc

	----------------------------
	
	
	Use kzalloc rather than the combination of kmalloc and memset.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,size,flags;
	statement S;
	@@
	
	-x = kmalloc(size,flags);
	+x = kzalloc(size,flags);
	 if (x == NULL) S
	-memset(x, 0, size);
	// </smpl>
	

sin_family/sin_family.cocci -  Use AF_INET for sin_family field

	----------------------------
	
	
	Elsewhere the sin_family field holds a value with a name of the form
	AF_..., so it seems reasonable to do so here as well.  Also the values of
	PF_INET and AF_INET are the same.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	struct sockaddr_in sip;
	@@
	
	(
	sip.sin_family ==
	- PF_INET
	+ AF_INET
	|
	sip.sin_family !=
	- PF_INET
	+ AF_INET
	|
	sip.sin_family =
	- PF_INET
	+ AF_INET
	)
	// </smpl>
	

sizeof/sizeof_sizeof.cocci -  Eliminate double sizeof

	florian.fainelli@telecomint.eu, jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	
	Subject: [PATCH] drivers/net/r6040.c: Eliminate double sizeof
	
	------------------------------------------------------
	
	
	Taking sizeof the result of sizeof is quite strange and does not seem to be
	what is wanted here.
	
	This was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression E;
	@@
	
	- sizeof (
	  sizeof (E)
	- )
	// </smpl>
	

sla/sla.cocci -  Use GFP_ATOMIC when a lock is held

	----------------------------
	
	
	A spin lock is taken near the beginning of the enclosing function.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	@@
	
	spin_lock(...)
	... when != spin_unlock(...)
	-GFP_KERNEL
	+GFP_ATOMIC
	// </smpl>
	

slot/slot.cocci -  Add missing pci_dev_put

	Pci_get_slot calls pci_dev_get, so pci_dev_put is needed before leaving the
	function.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	local idexpression x;
	expression e;
	@@
	
	*x = pci_get_slot(...)
	... when != true x == NULL
	    when != pci_dev_put(x)
	    when != e = x
	    when != if (x != NULL) {<+... pci_dev_put(x); ...+>}
	*return ...;
	// </smpl>
	

soc_sound/category2a_ssc_request.cocci -  Useless NULL test

	----------------------------
	
	
	The test (ssc != NULL) can only be reached if the call to the function
	ssc_request, the result of which ssc is assigned, succeeds. Moreover,
	two statements assign NULL to ssc just before a return, which is useless
	since it is a local variable. So, we suggest to delete the test and
	the two assignments.
	
	A simplified version of the semantic match that finds this problem is
	as follows: 
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@bad_null_test@
	expression x,E;
	@@
	x = ssc_request(...)
	... when != x = E
	* x != NULL
	// </smpl>
	

sockfd/patch.cocci -  Use sockfd_put

	net/bluetooth/bnep/sock.c
	net/bluetooth/cmtp/sock.c
	net/bluetooth/hidp/sock.c
	
	Send to:
	marcel@holtmann.org, maxk@qualcomm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] /net/bluetooth: Use sockfd_put
	
	------------------------------------------------------
	
	
	The function sockfd_lookup uses fget on the value that is stored in the
	file field of the returned structure, so fput should ultimately be applied
	to this value.  This can be done directly, but it seems better to use the
	sockfd specific macro sockfd_put, which does the same thing.
	
	
	The problem was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	expression s;
	@@
	
	   s = sockfd_lookup(...)
	   ...
	+  sockfd_put(s);
	?- fput(s->file);
	// </smpl>
	

stest/stest.cocci -  Description not available

	Description not available

strsize/strsizeof.cocci -  decrement sizeof size in strncmp

	----------------------------
	
	
	As observed by Joe Perches, sizeof of a constant string includes the
	trailing 0.  If what is wanted is to check the initial characters of
	another string, this trailing 0 should not be taken into account.  If an
	exact match is wanted, strcmp should be used instead.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression foo;
	constant char *abc;
	@@
	
	strncmp(foo, abc, 
	- sizeof(abc)
	+ sizeof(abc)-1
	 )
	// </smpl>
	

strtoul/simple.cocci -  change simple_strtol to simple_strtoul

	----------------------------
	
	
	Since size, addr, fcs, and tmp are unsigned, it would seem better to use
	simple_strtoul that simple_strtol.
	
	A simplified version of the semantic patch that makes this change is as
	follows: (http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@r2@
	long e;
	position p;
	@@
	
	e = simple_strtol@p(...)
	
	@@
	position p != r2.p;
	type T;
	T e;
	@@
	
	e = 
	- simple_strtol@p
	+ simple_strtoul
	  (...)
	// </smpl>
	

sz/sz.cocci -  Correct code taking the size of a pointer

	----------------------------
	
	
	sizeof(chid) is just the size of the pointer.  Change it to the size of the
	referenced structure.
	
	A simplified version of the semantic patch that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression *x;
	expression f;
	type T;
	@@
	
	*f(...,(T)x,...)
	// </smpl>
	

sz3/sz3.cocci -  take size of pointed value, not pointer

	Sizeof a pointer-typed expression returns the size of the pointer, not that
	of the pointed data.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression *e;
	type T;
	identifier f;
	@@
	
	f(...,(T)e,...,
	-sizeof(e)
	+sizeof(*e)
	,...)
	// </smpl>
	

tipc/tipc.cocci -  Use tipc_port_unlock

	net/tipc/port.c
	
	Send to:
	per.liden@ericsson.com, jon.maloy@ericsson.com, allan.stephens@windriver.com, tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] /net/tipc/port.c: Use tipc_port_unlock
	
	------------------------------------------------------
	
	
	The file net/tipc/port.c takes a lock using the function tipc_port_lock and
	then releases the lock sometimes using tipc_port_unlock and sometimes using
	spin_unlock_bh(p_ptr->publ.lock).  tipc_port_unlock simply does the
	spin_unlock_bh, but it seems cleaner to use it everywhere.
	
	
	The problem was fixed using the following semantic patch.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	struct port *p_ptr;
	@@
	
	   p_ptr = tipc_port_lock(...)
	   ...
	(
	   p_ptr = tipc_port_lock(...);
	|
	?- spin_unlock_bh(p_ptr->publ.lock);
	+  tipc_port_unlock(p_ptr);
	)
	// </smpl>
	

tty_port/sp10730.cocci -  Put correct tty value

	The tty value that should be put is the one that was just gotten by
	tty_port_tty_get, not the one that is the argument to the enclosing
	function.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@exists@
	local idexpression struct tty_struct *x;
	expression ra,rr;
	statement S1,S2;
	@@
	
	x = tty_port_tty_get(...)
	... when != x = rr
	    when any
	    when != tty_kref_put(x,...)
	    when != if (...) { ... tty_kref_put(x,...) ...}
	(
	if(<+...x...+>) S1 else S2
	|
	if(...) { ... when != x = ra
	     when forall
	     when != tty_kref_put(x,...)
	*return...;
	}
	)
	// </smpl>
	

typedef/handle.cocci -  Description not available

	Description not available

typedef/hv/device_object/DEVICE_OBJECT.cocci -  Staging: hv: Transform PDEVICE_OBJECT and DEVICE_OBJECT typedefs into their corresponding structs

	
	Remove typedef DEVICE_OBJECT and use a struct named hv_device instead.
	
	Remove typedef PDEVICE_OBJECT which aliases a pointer and use the
	struct pointer (struct hv_device *).
	
	Here is the semantic patch to perform this transformation:
	(http://coccinelle.lip6.fr/)
	
	//<smpl>
	@rm_PDEVICE_OBJECT@
	@@
	-typedef struct _DEVICE_OBJECT *PDEVICE_OBJECT;
	
	@rm_DEVICE_OBJECT@
	@@
	-typedef struct _DEVICE_OBJECT
	+struct hv_device
	{...}
	-DEVICE_OBJECT
	;
	
	@fixtypedef_PDEVICE_OBJECT@
	typedef PDEVICE_OBJECT;
	@@
	-PDEVICE_OBJECT
	+struct hv_device*
	
	@fixtypedef_DEVICE_OBJECT@
	typedef DEVICE_OBJECT;
	@@
	-DEVICE_OBJECT
	+struct hv_device
	
	@fixstruct__DEVICE_OBJECT@
	@@
	struct
	-_DEVICE_OBJECT
	+hv_device
	//</smpl>

typedef/hv/driver_object/DRIVER_OBJECT.cocci -  Staging: hv: Remove typedef DRIVER_OBJECT and PDRIVER_OBJECT

	
	typedef DRIVER_OBJECT and PDRIVER_OBJECT are removed and their usages
	are replace by the use of struct hv_driver and struct hv_driver *
	respectively.
	
	Here is the semantic patch generated to perform this transformation:
	(http://coccinelle.lip6.fr/)
	
	//<smpl>
	@rm_DRIVER_OBJECT@
	@@
	-typedef struct _DRIVER_OBJECT
	+struct hv_driver
	{...}
	-DRIVER_OBJECT
	;
	
	@rm_PDRIVER_OBJECT@
	@@
	-typedef struct _DRIVER_OBJECT *PDRIVER_OBJECT;
	+struct hv_driver;
	
	@fixtypedef_DRIVER_OBJECT@
	typedef DRIVER_OBJECT;
	@@
	-DRIVER_OBJECT
	+struct hv_driver
	
	@fixstruct__DRIVER_OBJECT@
	@@
	struct
	-_DRIVER_OBJECT
	+hv_driver
	
	@fixtypedef_PDRIVER_OBJECT@
	typedef PDRIVER_OBJECT;
	@@
	-PDRIVER_OBJECT
	+struct hv_driver*
	//</smpl>

typedef/hv/netvsc/NETVSC_PACKET.cocci -  Staging: hv: Remove typedef NETVSC_PACKET and PNETVSC_PACKET

	
	typedef NETVSC_PACKET and PNETVSC_PACKET are removed and their usages
	are replace by the use of struct hv_netvsc_packet and
	struct hv_netvsc_packet * respectively.
	
	Here is the semantic patch generated to perform this transformation:
	(http://coccinelle.lip6.fr/)
	
	//<smpl>
	@rm_NETVSC_PACKET@
	@@
	-typedef struct _NETVSC_PACKET
	+struct hv_netvsc_packet
	{...}
	-NETVSC_PACKET
	;
	
	@rm_PNETVSC_PACKET@
	@@
	-typedef struct _NETVSC_PACKET *PNETVSC_PACKET;
	+struct hv_netvsc_packet;
	
	@fixtypedef_NETVSC_PACKET@
	typedef NETVSC_PACKET;
	@@
	-NETVSC_PACKET
	+struct hv_netvsc_packet
	
	@fixstruct__NETVSC_PACKET@
	@@
	struct
	-_NETVSC_PACKET
	+hv_netvsc_packet
	
	@fixtypedef_PNETVSC_PACKET@
	typedef PNETVSC_PACKET;
	@@
	-PNETVSC_PACKET
	+struct hv_netvsc_packet*
	//</smpl>

typedef/hv/storvsc/STORVSC_REQUEST.cocci -  Staging: hv: Remove typedef STORVSC_REQUEST and PSTORVSC_REQUEST

	
	typedef STORVSC_REQUEST and PSTORVSC_REQUEST are removed and their
	usages are replace by the use of struct hv_storvsc_request and
	struct hv_storvsc_request * respectively.
	
	Here is the semantic patch generated to perform this transformation:
	(http://coccinelle.lip6.fr/)
	
	//<smpl>
	@rm_STORVSC_REQUEST@
	@@
	-typedef struct _STORVSC_REQUEST
	+struct hv_storvsc_request
	{...}
	-STORVSC_REQUEST
	;
	
	@rm_PSTORVSC_REQUEST@
	@@
	-typedef struct _STORVSC_REQUEST *PSTORVSC_REQUEST;
	+struct hv_storvsc_request;
	
	@fixtypedef_STORVSC_REQUEST@
	typedef STORVSC_REQUEST;
	@@
	-STORVSC_REQUEST
	+struct hv_storvsc_request
	
	@fixstruct__STORVSC_REQUEST@
	@@
	struct
	-_STORVSC_REQUEST
	+hv_storvsc_request
	
	@fixtypedef_PSTORVSC_REQUEST@
	typedef PSTORVSC_REQUEST;
	@@
	-PSTORVSC_REQUEST
	+struct hv_storvsc_request*
	//</smpl>

ubi/category2b_add_volume.cocci -  Bad IS_ERR test

	----------------------------
	
	
	In case of error, the function add_volume returns an ERR pointer. The
	result of IS_ERR, which is supposed to be used in a test as it is, is
	here checked to be less than zero, which seems odd. We suggest to
	replace this test by a simple IS_ERR test.
	
	A simplified version of the semantic match that finds this problem is
	as follows: 
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@def0@
	expression x;
	position p0;
	@@
	x@p0 = add_volume(...)
	
	@protected@
	expression def0.x,E;
	position def0.p0;
	position p;
	statement S;
	@@
	x@p0
	... when != x = E
	if (!IS_ERR(x) && ...) {<... x@p ...>} else S
	
	@unprotected@
	expression def0.x,E;
	identifier fld;
	position def0.p0;
	position p != protected.p;
	@@
	x@p0
	... when != x = E
	* x@p->fld
	// </smpl>
	

ubifs/category2a_kthread_create.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function kthread_create returns an ERR pointer,
	but never returns a NULL pointer. So a NULL test that comes before an
	IS_ERR test should be deleted.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x = kthread_create(...)
	... when != x = E
	* if (x == NULL) 
	S1 else S2
	// </smpl>
	

ulfe/ulfe.cocci -  use list_for_each_entry

	Use list_for_each_entry and perform some other induced simplifications.
	
	The semantic match that finds the opportunity for this reorganization is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	struct list_head *pos;
	struct list_head *head;
	statement S;
	@@
	
	*for (pos = (head)->next; pos != (head); pos = pos->next)
	S
	// </smpl>
	

unsf/unsf.cocci -  Fix unsigned return type

	In each case, the function has an unsigned return type, but returns a
	negative constant to indicate an error condition.  For move_block_from_dma,
	there is only one call and the return value is dropped, so it need not be
	unsigned.  For labpc_eeprom_write, there is only one call and the result is
	stored in a signed variable, so again the unsigned return type is not
	necessary.
	
	A sematic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@exists@
	identifier f;
	constant C;
	@@
	
	 unsigned f(...)
	 { <+...
	*  return -C;
	 ...+> }
	// </smpl>
	

unsf/unsf_ret0.cocci -  Fix unsigned return type

	In each case, the function has an unsigned return type, but returns a
	negative constant to indicate an error condition.  For move_block_from_dma,
	there is only one call and the return value is dropped, so it need not be
	unsigned.  For labpc_eeprom_write, there is only one call and the result is
	stored in a signed variable, so again the unsigned return type is not
	necessary.
	
	A sematic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@exists@
	identifier f;
	constant C;
	@@
	
	 unsigned f(...)
	 { <+...
	*  return -C;
	 ...+> }
	// </smpl>
	

unused/unused.cocci -  remove unused variable

	----------------------------
	
	
	The variable hlen is initialized but never used otherwise.
	
	The semantic patch that makes this change is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T;
	identifier i;
	constant C;
	@@
	
	(
	extern T i;
	|
	- T i;
	  <+... when != i
	- i = C;
	  ...+>
	)
	// </smpl>
	

unused_err/unused_err.cocci -  Use available error codes

	----------------------------
	
	
	In each case, error codes are stored in rc, but the return value is always
	0.  Return rc instead.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	local idexpression x;
	constant C;
	@@
	
	if (...) { ...
	  x = -C
	  ... when != x
	(
	  return <+...x...+>;
	|
	  return NULL;
	|
	  return;
	|
	* return ...;
	)
	}
	// </smpl>
	

urb2/urb2.cocci -  Delete unnecessary call to usb_kill_urb

	Since in each case nothing has been done with the recently allocated urb,
	it is not necessary to kill it before freeing it.
	
	The semantic patch that fixes this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	expression urb;
	statement S;
	position p1,p2;
	@@
	
	urb = usb_alloc_urb@p1(...);
	... when != urb
	if (urb == NULL) S
	... when != urb
	usb_kill_urb@p2(urb);
	
	@other exists@
	position r.p1,r.p2;
	@@
	
	... when != usb_alloc_urb@p1(...)
	usb_kill_urb@p2(...);
	
	@depends on !other exists@
	expression urb;
	position r.p1,r.p2;
	@@
	
	urb = usb_alloc_urb@p1(...);
	...
	(
	-usb_kill_urb@p2(urb);
	+usb_free_urb(urb);
	... when != urb
	|
	-usb_kill_urb@p2(urb);
	)
	// </smpl>
	

urb8/urb8.cocci -  Description not available

	Description not available

usb/category2a_back_device_reg.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function backlight_device_register returns an
	ERR pointer, but never returns a NULL pointer. So a NULL test that may
	come after a call to this function should be strengthened by an IS_ERR
	test.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x = backlight_device_register(...)
	... when != x = E
	* if (x != NULL) 
	S1 else S2
	// </smpl>
	

usb/category2a_isp1760_reg.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function backlight_device_register returns an
	ERR pointer, but never returns a NULL pointer. So a NULL test that may
	come after a call to this function should be strengthened by an IS_ERR
	test.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x = backlight_device_register(...)
	... when != x = E
	* if (x != NULL) 
	S1 else S2
	// </smpl>
	

usbdata/usb_get_intfdata.cocci -  Use usb_set/get_intfdata

	----------------------------
	
	
	Use the USB functions usb_get_intfdata and usb_set_intfdata instead of
	dev_get_drvdata and dev_set_drvdata, respectively.
	
	The semantic patch that makes this change for the usb_get_intfdata case is
	as follows: (http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@header@
	@@
	
	#include <linux/usb.h>
	
	@same depends on header@
	position p;
	@@
	
	usb_get_intfdata@p(...) { ... }
	
	@depends on header@
	position _p!=same.p;
	identifier _f;
	struct usb_interface*intf;
	@@
	
	_f@_p(...) { <+...
	- dev_get_drvdata(&intf->dev)
	+ usb_get_intfdata(intf)
	...+> }
	// </smpl>
	

usbdata/usb_set_intfdata.cocci -  Use usb_set/get_intfdata

	----------------------------
	
	
	Use the USB functions usb_get_intfdata and usb_set_intfdata instead of
	dev_get_drvdata and dev_set_drvdata, respectively.
	
	The semantic patch that makes this change for the usb_get_intfdata case is
	as follows: (http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@header@
	@@
	
	#include <linux/usb.h>
	
	@same depends on header@
	position p;
	@@
	
	usb_get_intfdata@p(...) { ... }
	
	@depends on header@
	position _p!=same.p;
	identifier _f;
	struct usb_interface*intf;
	@@
	
	_f@_p(...) { <+...
	- dev_get_drvdata(&intf->dev)
	+ usb_get_intfdata(intf)
	...+> }
	// </smpl>
	

usbdir/end.cocci -  Use usb_endpoint_dir_out

	----------------------------
	
	
	Use the usb_endpoint_dir_out API function.  Note that the use of
	USB_TYPE_MASK in the original code is incorrect; it results in a test that
	is always false.
	
	The semantic patch that makes this change is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	struct usb_endpoint_descriptor *endpoint;
	expression E;
	@@
	
	- (endpoint->bEndpointAddress & E) == USB_DIR_OUT
	+ usb_endpoint_dir_out(endpoint)
	// </smpl>
	

use_freed_specific/bad_kfree.cocci -  Eliminate use after free

	----------------------------
	
	
	dlpar_free_cc_nodes frees its argument, so dlpar_online_cpu should not be
	called on the same value.  Skip over the call to dlpar_online_cpu by
	jumping directly to out.
	
	A simplified version of the semantic patch that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression E,E2;
	@@
	
	dlpar_free_cc_nodes(E)
	...
	(
	  E = E2
	|
	* E
	)
	// </smpl>
	

usefreed/bad_kfree.cocci -  Correct use after free

	----------------------------
	
	
	In the case of igafb.c, the free appears to be part of cleanup code in the
	case of an error.  The code afterwards under the #ifdef is not meaningful
	in this case, because it extensively refers to structures that have been
	freed.  Furthermore, this initialization function would seem to have failed
	in the case where the kfrees are executed, so it does not seem reasonable
	to return 0 in this case.  Some other errors in the course of the function
	cause -ENOXIO to be returned, so that is added here.
	
	In panel-sharp-ls037v7dw01.c, a variable is introduced to hold the error
	code to return before freeing the structure that contains it.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,e;
	identifier f;
	iterator I;
	statement S;
	@@
	
	*kfree(x);
	... when != &x
	    when != x = e
	    when != I(x,...) S
	*x->f
	// </smpl>
	

usefreed/usefreed.cocci -  Correct use after free

	----------------------------
	
	
	In the case of igafb.c, the free appears to be part of cleanup code in the
	case of an error.  The code afterwards under the #ifdef is not meaningful
	in this case, because it extensively refers to structures that have been
	freed.  Furthermore, this initialization function would seem to have failed
	in the case where the kfrees are executed, so it does not seem reasonable
	to return 0 in this case.  Some other errors in the course of the function
	cause -ENOXIO to be returned, so that is added here.
	
	In panel-sharp-ls037v7dw01.c, a variable is introduced to hold the error
	code to return before freeing the structure that contains it.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression x,e;
	identifier f;
	iterator I;
	statement S;
	@@
	
	*kfree(x);
	... when != &x
	    when != x = e
	    when != I(x,...) S
	*x->f
	// </smpl>
	

uselesskfree/uselesskfree.cocci -  Removes useless kfree()

	Remove useless kfree() and clean up code related to the removal.
	
	The semantic patch that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r exists@
	position p1,p2;
	expression x;
	@@
	
	if (x@p1 == NULL) { ... kfree@p2(x); ... return ...; }
	
	@unchanged exists@
	position r.p1,r.p2;
	expression e <= r.x,x,e1;
	iterator I;
	statement S;
	@@
	
	if (x@p1 == NULL) { ... when != I(x,...) S
	                        when != e = e1
	                        when != e += e1
	                        when != e -= e1
	                        when != ++e
	                        when != --e
	                        when != e++
	                        when != e--
	                        when != &e
	   kfree@p2(x); ... return ...; }
	
	@ok depends on unchanged exists@
	position any r.p1;
	position r.p2;
	expression x;
	@@
	
	... when != true x@p1 == NULL
	kfree@p2(x);
	
	@depends on !ok && unchanged@
	position r.p2;
	expression x;
	@@
	
	*kfree@p2(x);
	// </smpl>
	

video/patch.cocci -  Use video_device_release rather than kfree

	drivers/media/radio/radio-maestro.c
	
	
	Send to:
	v4l-dvb-maintainer@linuxtv.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH 1/2] drivers/media/radio: Use video_device_release rather than kfree
	
	------------------------------------------------------
	
	
	The file drivers/media/video/videodev.c defines both video_device_alloc and
	video_device_release.  These are essentially just kzmalloc and kfree,
	respectively, but it seems better to use video_device_release, as done in
	the other media files, rather than kfree, in case the implementation some
	day changes.
	
	
	The problem was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@@
	type T,T1,T2;
	identifier E;
	statement S;
	expression x1,x2,x3;
	int ret;
	@@
	
	  T E;
	  ...
	* E = video_device_alloc(...);
	  if (E == NULL) S
	  ... when != video_device_release(...,(T1)E,...)
	      when != if (E != NULL) { ... video_device_release(...,(T1)E,...); ...}
	      when != x1 = (T1)E
	      when != E = x3;
	      when any
	  if (...) {
	    ... when != video_device_release(...,(T2)E,...)
	        when != if (E != NULL) { ... video_device_release(...,(T2)E,...); ...}
	        when != x2 = (T2)E
	(
	*   return;
	|
	*   return ret;
	)
	  }
	// </smpl>
	

write2/write2.cocci -  delete double assignment

	Delete successive assignments to the same location.
	
	A simplified version of the semantic match that finds this problem is as
	follows: (http://coccinelle.lip6.fr/)
	
	// <smpl>
	@@
	expression i;
	@@
	
	*i = ...;
	 i = ...;
	// </smpl>
	

wrongtest/wrongtest.cocci -  test the just-initialized value

	Test the just-initialized value rather than some other one.
	
	The semantic match that finds this problem is as follows:
	(http://coccinelle.lip6.fr/)
	
	// <smpl>
	@r@
	identifier x,y,f!={PTR_ERR,ERR_PTR,ERR_CAST};
	statement S;
	@@
	
	x = f(...);
	(
	if (\(x == NULL\|IS_ERR(x)\)) S
	|
	*if (\(y == NULL\|IS_ERR(y)\))
	 { ... when != x
	   return ...; }
	)
	// </smpl>
	

x25/patch.cocci -  Add missing x25_neigh_put

	net/x25/x25_forward.c
	
	
	Send to:
	eis@baty.hanse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
	
	Subject: [PATCH] net/x25: Add missing x25_neigh_put
	
	------------------------------------------------------
	
	
	The function x25_get_neigh increments a reference count.  At the point of
	the second goto out, the result of calling x25_get_neigh is only stored in
	a local variable, and thus no one outside the function will be able to
	decrease the reference count.  Thus, x25_neigh_put should be called before
	the return in this case.
	
	
	The problem was found using the following semantic match.
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	
	@@
	type T,T1,T2;
	identifier E;
	statement S;
	expression x1,x2,x3;
	int ret;
	@@
	
	  T E;
	  ...
	* if ((E = x25_get_neigh(...)) == NULL)
	  S
	  ... when != x25_neigh_put(...,(T1)E,...)
	      when != if (E != NULL) { ... x25_neigh_put(...,(T1)E,...); ...}
	      when != x1 = (T1)E
	      when != E = x3;
	      when any
	  if (...) {
	    ... when != x25_neigh_put(...,(T2)E,...)
	        when != if (E != NULL) { ... x25_neigh_put(...,(T2)E,...); ...}
	        when != x2 = (T2)E
	(
	*   return;
	|
	*   return ret;
	)
	  }
	// </smpl>
	

xand/xand.cocci -  Description not available

	Description not available

xfrm/category2a_xfrm_bundle_create.cocci -  Use an IS_ERR test rather than a NULL test

	----------------------------
	
	
	In case of error, the function xfrm_bundle_create returns an ERR
	pointer, but never returns a NULL pointer. So a NULL test that comes
	after an IS_ERR test should be deleted.
	
	The semantic match that finds this problem is as follows:
	(http://www.emn.fr/x-info/coccinelle/)
	
	// <smpl>
	@match_bad_null_test@
	expression x, E;
	statement S1,S2;
	@@
	x =  xfrm_bundle_create(...)
	... when != x = E
	*  if (x != NULL) 
	S1 else S2
	// </smpl>
	

zercst/zercst.cocci -  adjust suspicious bit operation

	IO_DATA_PATH_WIDTH_8 is 0, so a bit-and with it is always false.  The
	value IO_DATA_PATH_WIDTH covers the bits of the IO_DATA_PATH constants, so
	first pick those bits and then make the test using !=.
	
	This problem was found using Coccinelle (http://coccinelle.lip6.fr/).
	

zero/rezero.cocci -  Description not available

	Description not available

