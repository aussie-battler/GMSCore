/*
	GMS_fnc_spawnPatrolVehicle 

	Purpose: spawn and initialize a vehicle to be used for AI patrols 

	Parameters: 
		_className: class name of the vehicle to be spawned 
		_spawnPos: position at which to spawn the vehicle 
		__dir: compass heading of the spawned vehicle (default is 0) 
		_disable: true/false when true damage for the vehicle will be set to 1.0 when all crew are out 
		_removeFuel: true/false  when true all fuel will be removed when the crew leave the vehicle 
		_releasToPlayers: true/false  when true, empty vehicles will be unlocked and configured for use by players 
		_deleteTimer: time after which empty vehicles will be deleted if not entered in the drivers position by a player 

	Returns:
		_veh, the vehicle configured 

	Copyright 2020 by Ghostrider-GRG-

	Notes: TODO: need to add a check to the delete objects cue for vehicles that are not local to the server and assume these were entered a player.
		having a specific check that the owner is not an HC or is a player would also help here.
*/


params[
		"className",  // Clasname of vehicle to be spawned
		"_spawnPos",  //  selfevident
		["_dir",0]],  //  selfevident
		["_disable",0],  // a value greater than 0 will increase damage of the object to that level; set to 1.0 to disable turretes, 0.7 to neutralize vehciles
		["_removeFuel",false],  // when true fuel is removed from the vehicle
		["_releaseToPlayers",true],
		["_deleteTimer",300]
		];

private _veh = _this call GMS_fnc_createVehicle;
_veh addEventHandler["HandleDamage",{if (isServer) then {_this call GMS_fnc_vechicleHandleDamage;};};];
_veh addMPEventHandler["MPHit",{if (isServer) then {_this call GMS_fnc_vehicleHit;};};];
_veh addMPEventHandler["MPKilled",{if (isServer) then {_this call GMS_fnc_vehicleKilled;};};];
_veh addEventHandler["GetOut",{_this call GMS_fnc_getOutVehicle;};];
_veh setVariable["GMS_disable",_disable];
_veh setVariable["GMS_removeFuel",_removeFuel];
_veh setVariable["GMS_allowAccess",_releasToPlayers];
_veh setVariable["GMS_deleteEmptyVehicle",_deleteTimer];

_veh