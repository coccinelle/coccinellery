@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression x, y;
@@

(
- (((x + (y - 1)) / y) * y)
+ roundup(x, y)
|
- (((x + y - 1) / y) * y)
+ roundup(x, y)
)

@depends on haskernel@
expression x, y;
@@

(
- (((x + (y - 1)) / y) * y)
+ roundup(x, y)
|
- (((x + y - 1) / y) * y)
+ roundup(x, y)
)

@depends on haskernel@
expression x, y;
@@

- roundup((x), y)
+ roundup(x, y)

@depends on haskernel@
expression x, y;
@@

- roundup(x, (y))
+ roundup(x, y)

@r depends on haskernel@
identifier round_up, x, y;
@@

-#define round_up(x,y) roundup(x,y)

@depends on haskernel@
identifier r.round_up;
expression E1, E2;
@@

- round_up(E1,E2)
+ roundup(E1,E2)


@depends on haskernel@
expression n,d;
@@

(
- ((n + d - 1) / d)
+ DIV_ROUND_UP(n,d)
|
- ((n + (d - 1)) / d)
+ DIV_ROUND_UP(n,d)
)

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

@R depends on haskernel@
identifier ROUND_UP, x, y;
@@

-#define ROUND_UP(x,y) DIV_ROUND_UP(x,y)

@depends on haskernel@
identifier R.ROUND_UP;
expression E1, E2;
@@

- ROUND_UP(E1,E2)
+ DIV_ROUND_UP(E1,E2)
