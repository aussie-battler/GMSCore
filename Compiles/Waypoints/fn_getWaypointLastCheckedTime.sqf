/*
	gets the timestamp on a group 
	sets it if no timestamp is found
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_group"];
private _time = _group getVariable["GMS_lastChecked",0];
if (_time isEqualTo 0) then 
{
	[_group] call GMS_fnc_setWaypointLastCheckedTime;
	_time = _group getVariable["GMS_lastChecked",0];
};
_time