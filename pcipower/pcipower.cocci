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
