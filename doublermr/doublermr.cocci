@r@
expression e1,e2,e3;
position p1,p2,p3;
@@

release_mem_region@p1(e1, e2)@p3;
... when != request_mem_region(e1,e2,e3)
release_mem_region(e1, e2)@p2;

@@
expression e <= r.e1,e3;
expression r.e1,e2;
position r.p1,r.p2,r.p3,p!=r.p1;
@@

*release_mem_region(e1, e2)@p3;
... when != e = e3
*release_mem_region@p(e1, e2)@p2;