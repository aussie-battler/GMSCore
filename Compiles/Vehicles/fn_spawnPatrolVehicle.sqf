
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
_veh addEventHandler["HandleDamage",{_this call GMS_fnc_vechicleHandleDamage;};];
_veh addMPEventHandler["MPHit",{_this call GMS_fnc_vehicleHit;};];
_veh addMPEventHandler["MPKilled",{_this call GMS_fnc_vehicleKilled;};];
_veh addEventHandler["GetOut",{_this call GMS_fnc_getOutVehicle;};];
_veh setVariable["GMS_disable",_disable];
_veh setVariable["GMS_removeFuel",_removeFuel];
_veh setVariable["GMS_allowAccess",_releasToPlayers];
_veh setVariable["GMS_deleteEmptyVehicle",_deleteTimer];