@@
expression foo;
constant char *abc;
@@

strncmp(foo, abc, 
- sizeof(abc)
+ sizeof(abc)-1
 )
