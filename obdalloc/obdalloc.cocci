//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@disable unlikely@
expression ptr;
statement S,S1;
@@

  \(OBD_ALLOC\|OBD_ALLOC_WAIT\|OBD_ALLOC_PTR\|OBD_ALLOC_PTR_WAIT\)(ptr,...);
  if (unlikely(
+     !
      ptr
-      == NULL
     )) S else S1

@@
expression ptr;
statement S,S1;
@@

  \(OBD_ALLOC\|OBD_ALLOC_WAIT\|OBD_ALLOC_PTR\|OBD_ALLOC_PTR_WAIT\)(ptr,...);
  if (
+     !
      ptr
-      == NULL
     ) S else S1

@disable unlikely@
expression ptr;
statement S,S1;
@@

  \(OBD_ALLOC\|OBD_ALLOC_WAIT\|OBD_ALLOC_PTR\|OBD_ALLOC_PTR_WAIT\)(ptr,...);
  if (likely(
      ptr
-      != NULL
     )) S else S1

@@
expression ptr;
statement S,S1;
@@

  \(OBD_ALLOC\|OBD_ALLOC_WAIT\|OBD_ALLOC_PTR\|OBD_ALLOC_PTR_WAIT\)(ptr,...);
  if (
      ptr
-      != NULL
     ) S else S1

// -----------------------------------------------------------------------

@@
expression ptr,size;
@@

- OBD_ALLOC(ptr,size)
+ ptr = kzalloc(size, GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_ALLOC_WAIT(ptr,size)
+ ptr = kzalloc(size, GFP_KERNEL)

@@
expression ptr,size;
@@

- OBD_ALLOC_PTR(ptr)
+ ptr = kzalloc(sizeof(*ptr), GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_ALLOC_PTR_WAIT(ptr,size)
+ ptr = kzalloc(sizeof(*ptr), GFP_KERNEL)
