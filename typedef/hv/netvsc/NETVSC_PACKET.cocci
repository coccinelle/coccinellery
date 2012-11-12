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
