/*
	fn_hoverAndDropoff = {
*/
#include "\GMSCore\Init\GMS_defines.hpp"
private _group = group _this;
private  _aircraft = vehicle (_this);
//_m = format["hover and drop waypoint reached at postion %1",getPos _aircraft];
//systemChat _m;
//diag_log _m;
[_aircraft] spawn GMS_fnc_dropPayload;	 
_group setCurrentWaypoint[_group,_aircraft getVariable "finalWPIndex"];
_m = format["hoverAndDropoff: waypoint set to %1",currentWaypoint _group];
//systemChat _m;
//diag_log _m;