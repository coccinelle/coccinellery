//
//  Use function hrtimer_is_queued
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@header@
@@

#include <linux/hrtimer.h>

@same_hrtimer_is_queued depends on header@
position p;
@@

hrtimer_is_queued@p(...) { ... }

@depends on header@
position _p!=same_hrtimer_is_queued.p;
identifier _f;
struct hrtimer *_cocci_timer;
@@

_f@_p(...) { <+...
- (_cocci_timer->state & HRTIMER_STATE_ENQUEUED)
+ hrtimer_is_queued(_cocci_timer)
...+> }
