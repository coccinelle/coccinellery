virtual after_start

virtual returned
virtual returnedDup
virtual arg
virtual argDup
virtual all_args
virtual get
virtual nonull

virtual report
virtual irq

// ---------------------------------------------------------------------
// find functions

@plat depends on !after_start@
identifier i,pfn,rfn;
position p;
@@

struct platform_driver i@p = {
  .probe = pfn,
  .remove = (<+...rfn...+>),
};

// ---------------------------------------------------------------------
// set up iteration

@initialize:ocaml@

let reporting = ref false

type ret =
     UseReturned | UseReturned2 of string | UseReturnedDup | UseReturnedNN
     | UseArg | UseArgDup | UseArgNN | UseAllArgs | UseGet

let add pfn rfn alloc free devm_alloc file rule =
   let it = new iteration() in
   it#set_files [file];
   it#add_virtual_rule After_start;
   (match rule with
      UseReturned -> it#add_virtual_rule Returned
    | UseReturnedNN -> it#add_virtual_rule Returned; it#add_virtual_rule Nonull
    | UseReturnedDup -> it#add_virtual_rule ReturnedDup
    | UseReturned2(free) -> it#add_virtual_rule Returned;
      it#add_virtual_identifier Second_free free
    | UseArg -> it#add_virtual_rule Arg
    | UseArgNN -> it#add_virtual_rule Arg; it#add_virtual_rule Nonull
    | UseArgDup -> it#add_virtual_rule ArgDup
    | UseAllArgs -> it#add_virtual_rule All_args
    | UseGet -> it#add_virtual_rule Get);
   if !reporting then it#add_virtual_rule Report;
   if not (pfn="") then it#add_virtual_identifier Pfn pfn;
   if not (rfn="") then it#add_virtual_identifier Rfn rfn;
   if not (alloc="") then it#add_virtual_identifier Alloc alloc;
   if not (free="") then it#add_virtual_identifier Free free;
   if not (devm_alloc="") then it#add_virtual_identifier Devm_alloc devm_alloc;
   it#register()

@script:ocaml depends on report && !after_start@
@@
reporting := true

@script:ocaml@
pfn << plat.pfn;
rfn << plat.rfn;
p << plat.p;
@@

let file = (List.hd p).file in
add pfn rfn "kmalloc" "kfree" "devm_kzalloc" file UseReturned;
add pfn rfn "kzalloc" "kfree" "devm_kzalloc" file UseReturned;
add pfn rfn "ioremap" "iounmap" "devm_ioremap" file UseReturned;
add pfn rfn "ioremap_nocache" "iounmap" "devm_ioremap_nocache" file
   UseReturned;

add pfn rfn "clk_get" "clk_put" "devm_clk_get" file UseReturnedDup;
add pfn rfn "clk_get" "clk_put" "devm_clk_get_bad" file UseReturnedNN;

add pfn rfn "usb_get_phy" "usb_put_phy" "devm_usb_get_phy" file UseReturned;

add pfn rfn "pinctrl_get" "pinctrl_put" "devm_pinctrl_get" file UseReturned;
add pfn rfn "pinctrl_get_select_default" "pinctrl_put"
            "devm_pinctrl_get_select_default" file UseReturned;

add pfn rfn "regulator_get" "regulator_put" "devm_regulator_get"
            file UseReturned;
add pfn rfn "regulator_bulk_get" "regulator_bulk_free"
            "devm_regulator_bulk_get" file UseAllArgs;

add pfn rfn "gpio_request" "gpio_free" "devm_gpio_request" file UseArg;
add pfn rfn "gpio_request_one" "gpio_free" "devm_gpio_request_one" file UseArg;


add pfn rfn "request_irq" "free_irq" "devm_request_irq" file UseArg;
add pfn rfn "request_threaded_irq" "free_irq" "devm_request_threaded_irq" file
  UseArg;

add pfn rfn "dma_alloc_coherent" "dma_free_coherent" "dmam_alloc_coherent"
  file UseReturnedDup;
add pfn rfn "dma_alloc_noncoherent" "dma_free_noncoherent"
  "dmam_alloc_noncoherent" file UseReturnedDup;
add pfn rfn "dma_alloc_coherent" "dma_free_coherent" "dmam_alloc_coherent_bad"
  file UseReturnedNN;
add pfn rfn "dma_alloc_noncoherent" "dma_free_noncoherent"
  "dmam_alloc_noncoherent_bad" file UseReturnedNN;

(* several possibilities... *)
add pfn rfn "request_region" "release_region" "devm_request_region" file
  UseGet;
add pfn rfn "request_mem_region" "release_mem_region"
  "devm_request_mem_region" file UseGet;
add pfn rfn "request_region" "release_region" "devm_request_region" file
  UseArg;
add pfn rfn "request_mem_region" "release_mem_region"
  "devm_request_mem_region" file UseArg;
(* fix a bug at the same time *)
add pfn rfn "request_region" "release_resource" "devm_request_region" file
  (UseReturned2("kfree"));
add pfn rfn "request_mem_region" "release_resource"
  "devm_request_mem_region" file (UseReturned2("kfree"));
add pfn rfn "ioport_map" "ioport_unmap" "devm_ioport_map" file UseReturned

// ---------------------------------------------------------------------
// process the initial definition of the probe function

@preprobe@
identifier virtual.pfn;
position p;
@@

pfn@p(...) { ... }

@probe@
identifier pfn;
position preprobe.p;
@@

pfn@p(...) { ... }

@labelled_return@
identifier probe.pfn,l;
expression e;
@@

pfn(...) { <+... l: return e; ...+> }

// ---------------------------------------------------------------------
// transform functions where free uses the result

@prb depends on returned exists@
identifier probe.pfn,pdev,virtual.alloc,virtual.free,virtual.second_free;
expression x,y,e,a;
position p1,p2,p3;
type T1,T2,T3;
@@

pfn(struct platform_device *pdev) { ... when any
x = (T1)alloc@p1(a,...)
<... when strict
     when any
     when forall
(
y = x;
... when != y = e
    when != &y
free@p2(...,(T2)\(x\|y\),...);
... when != x
    when != y
second_free@p3(...,(T3)\(x\|y\),...);
|
y = x;
... when != y = e
    when != &y
free@p2(...,(T2)\(x\|y\),...);
|
free@p2(...,(T2)x,...);
... when != x
second_free@p3(...,(T3)x,...);
|
free@p2(...,(T2)x,...);
)
...>
}

@script:ocaml@
a << prb.a;
@@

if a = "NULL" then Coccilib.include_match false

@reme exists@
identifier virtual.rfn,virtual.free;
expression prb.x,prb.y;
type T;
@@

rfn(...) { ... free(...,(T)\(x\|y\),...); ... }

@rem depends on reme@
identifier virtual.rfn,virtual.free,virtual.second_free;
expression prb.x,prb.y;
position p4,p5;
type T,T1;
@@

rfn(...) {
<... when strict
(
free@p4(...,(T)\(x\|y\),...);
... when != x
second_free@p5(...,(T1)\(x\|y\),...);
|
free@p4(...,(T)\(x\|y\),...);
)
...>
}

@bad@
identifier virtual.free;
expression prb.x,prb.y;
position p != {prb.p2,rem.p4};
type T;
@@

free@p(...,(T)\(x\|y\),...)

@modif depends on rem && !bad && !report@
expression x;
identifier prb.pdev,virtual.alloc,virtual.free,virtual.devm_alloc;
identifier virtual.second_free;
expression list args;
position prb.p1,prb.p2,prb.p3,rem.p4,rem.p5;
type T;
@@

(
- free@p2(...);
|
- second_free@p3(...);
|
- free@p4(...);
|
- second_free@p5(...);
|
  x =
- alloc@p1(
+ devm_alloc(&pdev->dev,
    args)
|
  x = 
- (T)alloc@p1(
+ (T)devm_alloc(&pdev->dev,
    args)
)

@script:python depends on rem && !bad && report@
p1 << prb.p1;
alloc << virtual.devm_alloc;
@@
msg = "WARNING opportunity for %s" % (alloc)
coccilib.report.print_report(p1[0], msg)

// ---------------------------------------------------------------------
// transform functions where free uses the result
// special case for clk where don't add &pdev->dev

@prbdup depends on returnedDup exists@
identifier probe.pfn,pdev,virtual.alloc,virtual.free,virtual.second_free;
expression x,y,e;
expression list args;
position p1,p2,p3;
type T1,T2,T3;
@@

pfn(struct platform_device *pdev) { ... when any
x = (T1)alloc@p1(&pdev->dev,args)
<... when strict
     when any
     when forall
(
y = x;
... when != y = e
    when != &y
free@p2(...,(T2)\(x\|y\),...);
... when != x
    when != y
second_free@p3(...,(T3)\(x\|y\),...);
|
y = x;
... when != y = e
    when != &y
free@p2(...,(T2)\(x\|y\),...);
|
free@p2(...,(T2)x,...);
... when != x
second_free@p3(...,(T3)x,...);
|
free@p2(...,(T2)x,...);
)
...>
}

@remdupe exists@
identifier virtual.rfn,virtual.free;
expression prbdup.x,prbdup.y;
type T;
@@

rfn(...) { ... free(...,(T)\(x\|y\),...); ... }

@remdup depends on remdupe@
identifier virtual.rfn,virtual.free,virtual.second_free;
expression prbdup.x,prbdup.y;
position p4,p5;
type T,T1;
@@

rfn(...) {
<... when strict
(
free@p4(...,(T)\(x\|y\),...);
... when != x
second_free@p5(...,(T1)\(x\|y\),...);
|
free@p4(...,(T)\(x\|y\),...);
)
...>
}

@baddup@
identifier virtual.free;
expression prbdup.x,prbdup.y;
position p != {prbdup.p2,remdup.p4};
type T;
@@

free@p(...,(T)\(x\|y\),...)

@modifdup depends on remdup && !baddup && !report@
expression x;
identifier virtual.alloc,virtual.free,virtual.devm_alloc;
identifier virtual.second_free;
expression list args;
position prbdup.p1,prbdup.p2,prbdup.p3,remdup.p4,remdup.p5;
type T;
@@

(
- free@p2(...);
|
- second_free@p3(...);
|
- free@p4(...);
|
- second_free@p5(...);
|
  x =
- alloc@p1
+ devm_alloc
    (args)
|
  x = 
- (T)alloc@p1
+ (T)devm_alloc
    (args)
)

@script:python depends on remdup && !baddup && report@
p1 << prbdup.p1;
alloc << virtual.devm_alloc;
@@
msg = "WARNING opportunity for %s" % (alloc)
coccilib.report.print_report(p1[0], msg)

// ---------------------------------------------------------------------
// transform functions where free uses the first argument

@prbx depends on arg exists@
identifier probe.pfn,pdev,virtual.alloc,virtual.free;
expression x,y,e;
expression list args;
position p1,p2;
@@

pfn(struct platform_device *pdev) { ... when any
alloc@p1(x,args)
<... when strict
     when any
     when forall
(
y = x;
... when != y = e
    when != &y
free@p2(\(x\|y\),...);
|
free@p2(x,...)
)
...>
}

@script:ocaml@
x << prbx.x;
@@

if x = "NULL" then Coccilib.include_match false

@remxe exists@
identifier virtual.rfn, virtual.free;
expression prbx.x,prbx.y;
@@

rfn(...) { ... free(\(x\|y\),...); ... }

@remx depends on remxe@
identifier virtual.rfn, virtual.free;
expression prbx.x,prbx.y;
position p3;
@@

rfn(...) {
<... when strict
free@p3(\(x\|y\),...)
...>
}

@badx@
identifier virtual.free;
expression prbx.x,prbx.y;
position p != {prbx.p2,remx.p3};
@@

free@p(\(x\|y\),...)

@modifx depends on remx && !badx && !report@
expression x;
identifier prbx.pdev,virtual.alloc,virtual.free,virtual.devm_alloc;
expression list args;
position prbx.p1,prbx.p2,remx.p3;
@@

(
- free@p2(...);
|
- free@p3(...);
|
- alloc@p1(
+ devm_alloc(&pdev->dev,
   x,args)
)

@script:python depends on remx && !badx && report@
p1 << prbx.p1;
alloc << virtual.devm_alloc;
@@
msg = "WARNING opportunity for %s" % (alloc)
coccilib.report.print_report(p1[0], msg)

// ---------------------------------------------------------------------
// transform functions where free uses the first argument

@prbxdup depends on argDup exists@
identifier probe.pfn,pdev,virtual.alloc,virtual.free;
expression y,e;
expression list args;
position p1,p2;
@@

pfn(struct platform_device *pdev) { ... when any
alloc@p1(&pdev->dev,args)
<... when strict
     when any
     when forall
(
y = &pdev->dev;
... when != y = e
    when != &y
free@p2(y,...);
|
free@p2(&pdev->dev,...)
)
...>
}

@remxedup exists@
identifier virtual.rfn, virtual.free, prbxdup.pdev;
expression prbxdup.y;
@@

rfn(...) { ... free(\(&pdev->dev\|y\),...); ... }

@remxdup depends on remxedup@
identifier virtual.rfn, virtual.free, prbxdup.pdev;
expression prbxdup.y;
position p3;
@@

rfn(...) {
<... when strict
free@p3(\(&pdev->dev\|y\),...)
...>
}

@badxdup@
identifier virtual.free,prbxdup.pdev;
expression prbxdup.y;
position p != {prbxdup.p2,remxdup.p3};
@@

free@p(\(&pdev->dev\|y\),...)

@modifxdup depends on remxdup && !badxdup && !report@
identifier virtual.alloc,virtual.free,virtual.devm_alloc;
expression list args;
position prbxdup.p1,prbxdup.p2,remxdup.p3;
@@

(
- free@p2(...);
|
- free@p3(...);
|
- alloc@p1
+ devm_alloc
   (args)
)

@script:python depends on remxdup && !badxdup && report@
p1 << prbxdup.p1;
alloc << virtual.devm_alloc;
@@
msg = "WARNING opportunity for %s" % (alloc)
coccilib.report.print_report(p1[0], msg)

// ---------------------------------------------------------------------
// transform functions where free uses all arguments

@prbax depends on all_args exists@
identifier probe.pfn,pdev,virtual.alloc,virtual.free;
expression list x;
position p1,p2;
@@

pfn(struct platform_device *pdev) { ... when any
alloc@p1(x)
<... when strict
     when any
     when forall
free@p2(x)
...>
}

@remaxe exists@
identifier virtual.rfn, virtual.free;
expression list prbax.x;
@@

rfn(...) { ... free(x); ... }

@remax depends on remaxe@
identifier virtual.rfn, virtual.free;
expression list prbax.x;
position p3;
@@

rfn(...) {
<... when strict
free@p3(x)
...>
}

@badax@
identifier virtual.free;
expression list prbax.x;
position p != {prbax.p2,remax.p3};
@@

free@p(x)

@modifax depends on remax && !badax && !report@
identifier prbax.pdev,virtual.alloc,virtual.free,virtual.devm_alloc;
expression list x;
position prbax.p1,prbax.p2,remax.p3;
@@

(
- free@p2(...);
|
- free@p3(...);
|
- alloc@p1(
+ devm_alloc(&pdev->dev,
   x)
)

@script:python depends on remax && !badax && report@
p1 << prbax.p1;
alloc << virtual.devm_alloc;
@@
msg = "WARNING opportunity for %s" % (alloc)
coccilib.report.print_report(p1[0], msg)

// ---------------------------------------------------------------------
// transform functions where free uses the result of platform_get_resource

@prbg depends on get exists@
identifier probe.pfn,pdev,virtual.alloc,virtual.free;
expression x,y,e;
expression list args;
position p1,p2;
@@

pfn(struct platform_device *pdev) { ... when any
alloc@p1(x,args)
<... when strict
     when any
     when forall
(
y = x;
... when != y = e
    when != &y
free@p2(\(x\|y\),...);
|
free@p2(x,...)
)
...>
}

@remge exists@
identifier virtual.rfn, virtual.free;
identifier z;
identifier pdev;
expression e,n;
@@

rfn(struct platform_device *pdev) { ... when any
z = platform_get_resource(pdev, IORESOURCE_MEM, n)
... when != z = e
    when != &z
free(z->start,...)
...
}

@remg depends on remge@
identifier virtual.rfn, virtual.free;
identifier z;
identifier pdev;
position p3;
expression e,n;
@@

rfn(struct platform_device *pdev) {
<... when strict
z = platform_get_resource(pdev, IORESOURCE_MEM, n)
... when strict
    when != z = e
    when != &z
free@p3(z->start,...)
...>
}

@badg@
identifier virtual.free;
position p != {prbg.p2,remg.p3};
@@

free@p(...)

@modifg depends on remg && !badg && !report@
expression x;
identifier prbg.pdev,virtual.alloc,virtual.free,virtual.devm_alloc;
expression list args;
position prbg.p1,prbg.p2,remg.p3;
@@

(
- free@p2(...);
|
- free@p3(...);
|
- alloc@p1(
+ devm_alloc(&pdev->dev,
   x,args)
)

@script:python depends on remg && !badg && report@
p1 << prbg.p1;
alloc << virtual.devm_alloc;
@@
msg = "WARNING opportunity for %s" % (alloc)
coccilib.report.print_report(p1[0], msg)

// ---------------------------------------------------------------------
// cleanup, if the drvdata was only used to enable the free
// probably only relevant for kmalloc/kzalloc

@dclean depends on modif || modifdup || modifx || modifxdup || modifax || modifg@
identifier virtual.rfn, pdev, i;
type T;
@@

rfn(struct platform_device *pdev) { ...
(
- T i = platform_get_drvdata(pdev);
|
- T i = dev_get_drvdata(&pdev->drv);
|
- T i;
  ... when != i
(
- i = platform_get_drvdata(pdev);
|
- i = dev_get_drvdata(&pdev->drv);
)
)
... when != i
}

@rclean depends on modif || modifdup || modifx || modifxdup || modifax || modifg@
identifier virtual.rfn, pdev, i;
type T;
@@

rfn(struct platform_device *pdev) { ...
(
- T i = platform_get_resource(pdev,...);
|
- T i;
  ... when != i
- i = platform_get_resource(pdev,...);
)
... when != i
}

// ---------------------------------------------------------------------
// cleanup empty ifs, etc

@depends on modif || modifdup || modifx || modifxdup || modifax || modifg@
identifier probe.pfn;
@@

pfn(...) { <...
- if (...) {}
...> }

@depends on modif || modifdup || modifx || modifxdup || modifax || modifg@
identifier virtual.rfn;
@@

rfn(...) { <...
- if (...) {}
...> }

@depends on modif || modifdup || modifx || modifxdup || modifax || modifg@
identifier probe.pfn;
expression ret,e;
@@

pfn(...) { <...
+ return
- ret =
 e;
- return ret;
...> }

@depends on modif || modifdup || modifx || modifxdup || modifax || modifg@
identifier virtual.rfn;
expression ret,e;
@@

rfn(...) { <...
+ return
- ret =
 e;
- return ret;
...> }

// ---------------------------------------------------------------------

// this is likely to leave dead code, if l: is preceded by a return
// because we are control-flow based, there is no way to match on that
@depends on labelled_return && (modif || modifdup || modifx || modifxdup || modifax || modifg)@
identifier l,l1,l2;
expression e;
statement S;
identifier probe.pfn;
identifier i;
statement S1,S2;
@@

pfn(...) { <...
- goto l;
+ goto l2;
...
-l:
<... when != S
     when any
l1:
...>
l2:
(
 (<+...i...+>);
|
 if (...) S1 else S2
|
 while (...) S1
|
 for (...;...;...) S1
|
 return e;
)
...> }

@depends on !labelled_return && (modif || modifdup || modifx || modifxdup || modifax || modifg)@
identifier l,l1,l2;
expression e;
statement S;
identifier probe.pfn;
identifier i;
statement S1,S2;
@@

pfn(...) { <...
(
- goto l;
+ goto l2;
...
-l:
<... when != S
     when any
l1:
...>
l2:
(
 (<+...i...+>);
|
 if (...) S1 else S2
|
 while (...) S1
|
 for (...;...;...) S1
)
|
- goto l;
+ return e;
...
-l:
<... when != S
     when any
l1:
...>
return e;
)
...> }

@depends on !labelled_return && (modif || modifdup || modifx || modifxdup || modifax || modifg)@
expression e1,e2;
identifier probe.pfn;
@@

pfn(...) { <...
-e1 = e2;
-return e1;
+return e2;
...> }
