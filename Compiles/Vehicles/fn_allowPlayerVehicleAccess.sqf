/*
	GMS_fnc_allowPlayerAccess 

	Purpose: Configure a vehicle to allow players access
	
	Parameters: _veh, the vehicle to be handled 

	Returns: None 

	Copyright 2020 by Ghostrider-GRG- 

	Notes: variables pulled from the vehicle are set by spawnVehiclePatrol 	
	TODO: This code should be broadcast ?
*/

#include "\GMSCore\Init\GMS_defines.hpp"
params["_veh"];
private _accessAllowed = _veh getVariable ["GMS_allowAccess",true];
if !(_accessAllowed) then 
{
	private _disable = _veh getVariable["GMS_disable",true];
	private _deleteTime = _veh getVariable ["GMS_deleteTime",120];
	_veh setDamage _disable;  //  Allows us to totally disable statics if desired
	[_veh, _deleteTime] call GMS_fnc_addObjectsToDeletionCue;
} else {
	_veh enableRopeAttach true;
	_veh enableCoPilot true;
	if (_veh getVariable["GMS_removeFuel",true]) then 
	{
		_veh setFuel 0;
	};
	if (local _veh) then // only bother to fire this on the machine on which the vehicle is local
	{
		_veh lock 1;
	} else {
		// some fancy remoteExec stuff
	};
};
