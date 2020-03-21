/*
	fn_arrivedOnStation
*/
#include "\GMSCore\Init\GMS_defines.hpp"

private _group = group(_this);
private _aircraft = vehicle (_this);
_aircraft setSpeedMode "LIMITED";
_group setCurrentWaypoint[_group,_aircraft getVariable "wp3Index"];

