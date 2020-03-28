/*
	GMS_fnc_createVehicle 

	Purpose: generic function for creating vehicles 

	Parameters:
		_vehType, classname of the vehicle to be spawned 
		_pos, position at which to spawn 
		_dir, compass heading of the vehicle (optional) 

	Returns: None 

	Copyright 2020 by Ghostrider-GRG- 

	Notes: 	Used by SpawnPatrolVehicle 
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_vehType","_pos",["_dir",0]];
private _veh = createVehicle[_vehType, _pos, [], 0, "NONE"];
_veh setVectorUp surfaceNormal position _veh;
_veh setDir _dir;
_veh allowDamage true;
_veh enableRopeAttach true;
_veh setVariable["GMS_vehicle",true];
if (toLower(GMS_modType) isEqualTo "epoch") then
{
	_veh call EPOCH_server_setVToken;
};
[_veh] call GMS_fmc_emptyObjectInventory;

_veh