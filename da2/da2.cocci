//
//  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
//
// Target: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Copyright:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// License:  Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// Author: Not available\ncoccinellery-short = Not available\ncoccinellery-copyright = Copyright: 2012 - LIP6/INRIA\ncoccinellery-license = Licensed under GPLv2 or any later version.\ncoccinellery-author0 = Not available\n\nNot available\n
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@r@
expression i,f;
position p1,p2;
@@

(
 i = <+...f(...)...+>;
|
 i |= <+...f(...)...+>;
|
 i &= <+...f(...)...+>;
|
 i += <+...f(...)...+>;
|
 i -= <+...f(...)...+>;
|
 i *= <+...f(...)...+>;
|
 i /= <+...f(...)...+>;
|
 i %= <+...f(...)...+>;
|
 i ^= <+...f(...)...+>;
|
 i <<= <+...f(...)...+>;
|
 i >>= <+...f(...)...+>;
|
 i@p1 = ...;
|
 i@p1 |= ...;
|
 i@p1 &= ...;
|
 i@p1 += ...;
|
 i@p1 -= ...;
|
 i@p1 *= ...;
|
 i@p1 /= ...;
|
 i@p1 %= ...;
|
 i@p1 ^= ...;
|
 i@p1 <<= ...;
|
 i@p1 >>= ...;
|
 i@p1 ++;
|
 ++i@p1;
|
 i@p1 --;
|
 --i@p1;
)
(
 i = <+...i...+>;
|
 i = <+...f(...)...+>;
|
 i@p2 = ...;
)

@@
expression i,j,f;
position r.p1,r.p2;
@@

(
 (<+...i@p1...+>);
)
(
 (<+...\(j++\|++j\|j--\|--j\|f(...)\)...+>) = ...;
|
*i@p2 = ...;
)