@cst@
position p;
@@

 \( DST_TYPE_IS_SAT@p\|DST_TYPE_IS_TERR@p\|DST_TYPE_IS_CABLE@p\|DST_TYPE_IS_ATSC@p \)

@@
struct dst_state E;
position cst.p;
expression v;
@@

(
*E.type_flags = 
 <+...v@p...+>
|
*E.type_flags == 
  <+...v@p...+>
|
*E.type_flags != 
  <+...v@p...+>
|
*E.type_flags + 
  <+...v@p...+>
|
*E.type_flags & 
  <+...v@p...+>
|
*E.type_flags | 
  <+...v@p...+>
|
*E.type_flags & ~
  <+...v@p...+>
|
*E.type_flags | ~
  <+...v@p...+>
|
*E.type_flags &= 
  <+...v@p...+>
|
*E.type_flags |= 
  <+...v@p...+>
|
*E.type_flags &= ~
  <+...v@p...+>
|
*E.type_flags |= ~
  <+...v@p...+>
)