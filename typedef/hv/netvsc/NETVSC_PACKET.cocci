//
//  Remove typedef NETVSC_PACKET and PNETVSC_PACKET
//
// Target: Linux
// Copyright:  2012 - LIP6/INRIA
// License:  Licensed under ISC. See LICENSE or http://www.isc.org/software/license
// Author: Nicolas Palix <npalix@diku.dk>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@rm_NETVSC_PACKET@
@@
-typedef struct _NETVSC_PACKET
+struct hv_netvsc_packet
{...}
-NETVSC_PACKET
;

@rm_PNETVSC_PACKET@
@@
-typedef struct _NETVSC_PACKET *PNETVSC_PACKET;
+struct hv_netvsc_packet;

@fixtypedef_NETVSC_PACKET@
typedef NETVSC_PACKET;
@@
-NETVSC_PACKET
+struct hv_netvsc_packet

@fixstruct__NETVSC_PACKET@
@@
struct
-_NETVSC_PACKET
+hv_netvsc_packet

@fixtypedef_PNETVSC_PACKET@
typedef PNETVSC_PACKET;
@@
-PNETVSC_PACKET
+struct hv_netvsc_packet*
