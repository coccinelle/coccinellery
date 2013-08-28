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
