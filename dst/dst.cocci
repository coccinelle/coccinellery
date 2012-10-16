//
// Description not available
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Author name not available
//

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