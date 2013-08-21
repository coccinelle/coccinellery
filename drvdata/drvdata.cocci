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
