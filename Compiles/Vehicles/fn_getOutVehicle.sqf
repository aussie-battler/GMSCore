/*
	GMS_fnc_getOutVehicle 

	Purpose: fired locally when the "GetOut" EH fires for the object/vehicle. 
		This will allow us to track empty vehicles in real time on clients or HC. 

	Parameters: per https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#GetOut

	Returns: BIS_fnc_respawnNone

	Copyright 2020 by Ghostrider-GRG- 

	Notes: can be assigned remotely but only fires on the client owning teh object.	
	TODO: address locality for this function.
*/

#define veh _this select 0
if ((isServer) || local (veh)) then {[veh] call blck_fnc_checkForEmptyVehicle};