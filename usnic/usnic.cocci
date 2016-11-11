@@
expression t,e;
@@

t = \(usnic_ib_qp_grp_get_chunk(...)\|get_qp_res_chunk(...)\)
... when != t=e
- IS_ERR_OR_NULL(t)
+ IS_ERR(t)

@@
expression t,e,e1;
@@

t = \(usnic_ib_qp_grp_get_chunk(...)\|get_qp_res_chunk(...)\)
... when != t=e
?- t ? PTR_ERR(t) : e1
+ PTR_ERR(t)
... when any

