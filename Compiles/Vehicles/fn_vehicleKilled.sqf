/*
	fn_vehicleKilled 
	Purpose: do basic housekeeping needed when a vehicle is killed.

	Note: wrecks are deleted at 120 secs by default.
*/

#include "\GMSCore\Init\GMS_defines.hpp"

params["_veh"];

[_veh] call GMS_fnc_removeAllLocalEventHandlers;
[_veh] call GMS_fnc_removeAllMPEventHandlers;
[_veh,120] call GMS_fnc_addObjectToDeletionCue;

