//
//  Use dst_type field instead of type_flags
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

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