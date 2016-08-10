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
expression x,dev,entries,nvec;
statement S1,S2;
@@

- x = pci_enable_msix_range(dev, entries, nvec, nvec);
+ x = pci_enable_msix_exact(dev, entries, nvec);
  if (
-     x > 0
+     !x
     ) S1 else S2

@@
expression x,dev,entries,nvec;
statement S1,S2;
@@

 if (
-    pci_enable_msix_range(dev, entries, nvec, nvec) > 0
+    !pci_enable_msix_exact(dev, entries, nvec)
    )
   S1 else S2

@@
expression x,dev,entries,nvec;
statement S1,S2;
@@

- x = pci_enable_msix_range(dev, entries, nvec, nvec);
+ x = pci_enable_msix_exact(dev, entries, nvec);
  if (x < 0) S1 else S2


