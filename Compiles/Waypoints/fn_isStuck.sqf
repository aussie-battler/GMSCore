/*
	GMS_fnc_initializeWaypoints 
	Can be used to configure a patrol area for any kind of group (infantry, land, air sea)
	The group will move about within the area circumscribed by the parameters below moving from one randome location to the next.
	If an enemy is identified, it will move toward that enemy and try to engage.
	If the group monitor determines tha ta group is 'stuck' meaning has not rotated waypoints within some proscribed period, the group will be disengaged and returned to the center of the patrol area.

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_group"];
private _stuck = _group getVariable["GMS_antiStuck",false];
_stuck