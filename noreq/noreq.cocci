@@
identifier l;
statement S1;
expression e,e1;
@@

*e = platform_get_irq(...);
... when != request_irq(e,...)
    when != request_threaded_irq(e,...)
    when != request_any_context_irq(e,...)
    when != if (...) { <+... request_irq(e,...) ...+> } else S1
    when != if (...) { <+... request_threaded_irq(e,...) ...+> } else S1
    when != if (...) { <+... request_any_context_irq(e,...) ...+> } else S1
    when != e1 = e
*goto l;
...
*free_irq(e,...)

@@
identifier l;
statement S,S1;
expression e,e1;
@@

*e = platform_get_irq(...);
... when != request_irq(e,...)
    when != request_threaded_irq(e,...)
    when != request_any_context_irq(e,...)
    when != if (...) { <+... request_irq(e,...) ...+> } else S1
    when != if (...) { <+... request_threaded_irq(e,...) ...+> } else S1
    when != if (...) { <+... request_any_context_irq(e,...) ...+> } else S1
*e1 = e;
... when != request_irq(\(e\|e1\),...)
    when != request_threaded_irq(\(e\|e1\),...)
    when != request_any_context_irq(\(e\|e1\),...)
    when != if (...) { <+... request_irq(\(e\|e1\),...) ...+> } else S
    when != if (...) { <+... request_threaded_irq(\(e\|e1\),...) ...+> } else S
    when != if (...) { <+... request_any_context_irq(\(e\|e1\),...) ...+> } else S
*goto l;
...
*free_irq(\(e\|e1\),...)

@@
identifier l;
statement S;
expression e,e1;
@@

*e1 = e = platform_get_irq(...);
... when != request_irq(\(e\|e1\),...)
    when != request_threaded_irq(\(e\|e1\),...)
    when != request_any_context_irq(\(e\|e1\),...)
    when != if (...) { <+... request_irq(\(e\|e1\),...) ...+> } else S
    when != if (...) { <+... request_threaded_irq(\(e\|e1\),...) ...+> } else S
    when != if (...) { <+... request_any_context_irq(\(e\|e1\),...) ...+> } else S
*goto l;
...
*free_irq(\(e\|e1\),...)

// -------------------------------------------------------------------------

@@
identifier l;
statement S,S1;
expression e,e2,e3;
@@

*e = platform_get_resource(e2,IORESOURCE_IRQ,e3);
... when != request_irq(e->start,...)
    when != request_threaded_irq(e->start,...)
    when != request_any_context_irq(e->start,...)
    when != if (...) { <+... request_irq(e->start,...) ...+> } else S1
    when != if (...) { <+... request_threaded_irq(e->start,...) ...+> } else S1
    when != if (...) { <+... request_any_context_irq(e->start,...) ...+> } else S1
*goto l;
...
*free_irq(e->start,...)

@@
identifier l;
statement S,S1;
expression e,e1,e2,e3;
@@

*e = platform_get_resource(e2,IORESOURCE_IRQ,e3);
... when != request_irq(e->start,...)
    when != request_threaded_irq(e->start,...)
    when != request_any_context_irq(e->start,...)
    when != if (...) { <+... request_irq(e->start,...) ...+> } else S1
    when != if (...) { <+... request_threaded_irq(e->start,...) ...+> } else S1
    when != if (...) { <+... request_any_context_irq(e->start,...) ...+> } else S1
e1 = e->start;
... when != request_irq(\(e->start\|e1\),...)
    when != request_threaded_irq(\(e->start\|e1\),...)
    when != request_any_context_irq(\(e->start\|e1\),...)
    when != if (...) { <+... request_irq(\(e->start\|e1\),...) ...+> } else S
    when != if (...) { <+... request_threaded_irq(\(e->start\|e1\),...) ...+> } else S
    when != if (...) { <+... request_any_context_irq(\(e->start\|e1\),...) ...+> } else S
*goto l;
...
*free_irq(\(e->start\|e1\),...)
