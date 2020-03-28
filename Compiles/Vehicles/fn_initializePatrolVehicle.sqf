/*
	GMS_fnc_initializePatrolVehicle 

	Purpose: provides a contianer function in case other initializations have to be added. 

	Parameters: _veh, the vehicle to be initialized 

	Returns: None 

	Copyright 2020 by Ghostrider-GRG- 

	Notes: TODO: see if we really need this.	
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_veh"];

[_veh] call GMS_fnc_restrictPlayerVehicleAccess;

