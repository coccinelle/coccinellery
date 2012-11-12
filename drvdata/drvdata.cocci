//
// use dev_set_drvdata
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@@
struct device dev;
expression E;
type T;
@@

- dev.driver_data = (T)E
+ dev_set_drvdata(&dev, E)

@@
struct device *dev;
expression E;
type T;
@@

- dev->driver_data = (T)E
+ dev_set_drvdata(dev, E)

@@
struct device dev;
type T;
@@

- (T)dev.driver_data
+ dev_get_drvdata(&dev)

@@
struct device *dev;
type T;
@@

- (T)dev->driver_data
+ dev_get_drvdata(dev)
