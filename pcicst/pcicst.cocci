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
@@

(
pci_map_single
|
pci_unmap_single
|
pci_map_page
|
pci_unmap_page
|
pci_map_sg
|
pci_unmap_sg
|
pci_dma_sync_single_for_cpu
|
pci_dma_sync_single_for_device
|
pci_dma_sync_sg_for_cpu
|
pci_dma_sync_sg_for_device
)
 (...,
(
- DMA_BIDIRECTIONAL
+ PCI_DMA_BIDIRECTIONAL
|
- DMA_TO_DEVICE
+ PCI_DMA_TODEVICE
|
- DMA_FROM_DEVICE
+ PCI_DMA_FROMDEVICE
|
- DMA_NONE
+ PCI_DMA_NONE
)
 )
