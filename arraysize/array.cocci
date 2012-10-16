@i@
@@

#include <linux/kernel.h>

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(*E))
+ ARRAY_SIZE(E)

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(E[...]))
+ ARRAY_SIZE(E)

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(T))
+ ARRAY_SIZE(E)

@n@
identifier AS,E;
@@

- #define AS(E) ARRAY_SIZE(E)

@@
expression E;
identifier n.AS;
@@

- AS(E)
+ ARRAY_SIZE(E)
