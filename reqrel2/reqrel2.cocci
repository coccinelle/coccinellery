@@
expression E1,E2,E3;
@@

request_mem_region(E1,E2,E3)
...
?- release_region(E1,E2)
+ release_mem_region(E1,E2)

@@
expression E1,E2,E3;
@@

request_region(E1,E2,E3)
...
?- release_mem_region(E1,E2)
+ release_region(E1,E2)
