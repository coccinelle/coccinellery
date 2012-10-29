@ change_compare @
expression E;
@@

(
- jiffies <= (E)
+ time_before_eq(jiffies,E)
|
- jiffies >= (E)
+ time_after_eq(jiffies,E)
|
- jiffies < (E)
+ time_before(jiffies,E)
|
- jiffies > (E)
+ time_after(jiffies,E)
)


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

@ change_zero @
expression E;
type T;
@@

(
- (T)(E - jiffies) <= 0
+ time_after_eq(jiffies,E)
|
- (T)(jiffies - E) <= 0
+ time_before_eq(jiffies,E)
|
- (T)(E - jiffies) >= 0
+ time_before_eq(jiffies,E)
|
- (T)(jiffies - E) >= 0
+ time_after_eq(jiffies,E)
|
- (T)(E - jiffies) < 0
+ time_after(jiffies,E)
|
- (T)(jiffies - E) < 0
+ time_before(jiffies,E)
|
- (T)(E - jiffies) > 0
+ time_before(jiffies,E)
|
- (T)(jiffies - E) > 0
+ time_after(jiffies,E)
)

@ change_zero_np @
expression E;
@@

(
- E - jiffies <= 0
+ time_after_eq(jiffies,E)
|
- jiffies - E <= 0
+ time_before_eq(jiffies,E)
|
- E - jiffies >= 0
+ time_before_eq(jiffies,E)
|
- jiffies - E >= 0
+ time_after_eq(jiffies,E)
|
- E - jiffies < 0
+ time_after(jiffies,E)
|
- jiffies - E < 0
+ time_before(jiffies,E)
|
- E - jiffies > 0
+ time_before(jiffies,E)
|
- jiffies - E > 0
+ time_after(jiffies,E)
)

@ change_all @
expression E1,E2,E3;
type T;
@@

(
- (T)(jiffies - E1) <= (E2*E3)
+ time_before_eq(jiffies, E1+E2*E3)
|
- (T)(jiffies - E1) <= E2
+ time_before_eq(jiffies, E1+E2)
|
- (T)(jiffies - E1) >= (E2*E3)
+ time_after_eq(jiffies, E1+E2*E3)
|
- (T)(jiffies - E1) >= E2
+ time_after_eq(jiffies, E1+E2)
|
- (T)(jiffies - E1) < (E2*E3)
+ time_before(jiffies, E1+E2*E3)
|
- (T)(jiffies - E1) < E2
+ time_before(jiffies, E1+E2)
|
- (T)(jiffies - E1) > (E2*E3)
+ time_after(jiffies, E1+E2*E3)
|
- (T)(jiffies - E1) > E2
+ time_after(jiffies, E1+E2)
)

@ change_all_np @
expression E1,E2,E3;
@@

(
- jiffies - E1 <= (E2*E3)
+ time_before_eq(jiffies, E1+E2*E3)
|
- jiffies - E1 <= E2
+ time_before_eq(jiffies, E1+E2)
|
- jiffies - E1 >= (E2*E3)
+ time_after_eq(jiffies, E1+E2*E3)
|
- jiffies - E1 >= E2
+ time_after_eq(jiffies, E1+E2)
|
- jiffies - E1 < (E2*E3)
+ time_before(jiffies, E1+E2*E3)
|
- jiffies - E1 < E2
+ time_before(jiffies, E1+E2)
|
- jiffies - E1 > (E2*E3)
+ time_after(jiffies, E1+E2*E3)
|
- jiffies - E1 > E2
+ time_after(jiffies, E1+E2)
)

@ include
  depends on change_compare || change_compare_np ||
  change_zero || change_all || change_zero_np || change_all_np @
@@

#include <linux/jiffies.h>

@ no_include depends on !include &&
  (change_compare || change_compare_np ||
   change_zero || change_all || change_zero_np || change_all_np) @
@@

  #include <linux/...>
+ #include <linux/jiffies.h>
