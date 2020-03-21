/*
	fn_selectDropWaypoint = {
*/
#include "\GMSCore\Init\GMS_defines.hpp"
//_m = format["selectDropWaypoint reached at position %1, approaching drop point and slowing for paratroop deployment",getPos (leader _group)];
//systemChat _m;
//diag_log _m;
private _aircraft = vehicle _this;
_aircraft setSpeedMode "LIMITED";	
(group _this) setCurrentWaypoint [group _this,_aircraft getVariable "dropCargoIndex"];
//_m = format["selectDropWaypoint: waypoint set to %1",currentWaypoint (group _this)];
//systemChat _m;
//diag_log _m;	
/*
private _group = group _this;


//_group setCurrentWaypoint (_aircraft getVariable "WP2");
