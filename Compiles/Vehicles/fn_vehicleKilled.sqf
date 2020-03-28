/*
	GMS_fnc_vehicleKilled 

	Purpose: Called when the MPKilled EH for a vehicle is fired to do basic housekeeping needed when a vehicle is killed.

	Parameters: per https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#MPKilled 

	Returns: None 

	Copyright 2020 by Ghostrider-GRG-

	Note: wrecks are deleted at 120 secs by default.
	TODO: check the parameters here.
*/

#include "\GMSCore\Init\GMS_defines.hpp"

params["_veh"];
[_veh] call GMS_fnc_removeAllLocalEventHandlers;
[_veh] call GMS_fnc_removeAllMPEventHandlers;
[_veh, 120] call GMS_fnc_addObjectToDeletionCue;


