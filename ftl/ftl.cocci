//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression t,e;
@@

t = \(xt_find_table_lock(...)\|
      try_then_request_module(xt_find_table_lock(...),...)\)
... when != t=e
- ! IS_ERR_OR_NULL(t)
+ t

@@
expression t,e;
@@

t = \(xt_find_table_lock(...)\|
      try_then_request_module(xt_find_table_lock(...),...)\)
... when != t=e
- IS_ERR_OR_NULL(t)
+ !t

@@
expression t,e,e1;
@@

t = \(xt_find_table_lock(...)\|
      try_then_request_module(xt_find_table_lock(...),...)\)
... when != t=e
?- t ? PTR_ERR(t) : e1
+ e1
... when any

