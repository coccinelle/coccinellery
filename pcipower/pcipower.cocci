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
expression pdev;
@@

pci_set_power_state(pdev,
(
- 0
+ PCI_D0
|
- 1
+ PCI_D1
|
- 2
+ PCI_D2
|
- 3
+ PCI_D3hot
|
- 4
+ PCI_D3cold
|
- 5
+ PCI_UNKNOWN
|
- -1
+ PCI_POWER_ERROR
)
 )

@@
expression e1,e2;
@@

pci_enable_wake(e1,
(
- 0
+ PCI_D0
|
- 1
+ PCI_D1
|
- 2
+ PCI_D2
|
- 3
+ PCI_D3hot
|
- 4
+ PCI_D3cold
|
- 5
+ PCI_UNKNOWN
|
- -1
+ PCI_POWER_ERROR
)
,e2)
