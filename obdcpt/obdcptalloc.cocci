@@
expression ptr,cptab,cpt,size,gfp;
@@

- OBD_CPT_ALLOC_GFP(ptr, cptab, cpt, size, gfp)
+ ptr = kzalloc_node(size, gfp, cfs_cpt_spread_node(cptab, cpt))

@@
expression ptr,cptab,cpt,size;
@@

- OBD_CPT_ALLOC(ptr, cptab, cpt, size)
+ ptr = kzalloc_node(size, GFP_NOFS, cfs_cpt_spread_node(cptab, cpt))

@@
expression ptr,cptab,cpt;
@@

- OBD_CPT_ALLOC_PTR(ptr, cptab, cpt)
+ ptr = kzalloc_node(sizeof(*ptr), GFP_NOFS, cfs_cpt_spread_node(cptab, cpt))
