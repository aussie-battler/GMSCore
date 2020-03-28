
/*
	GMS_fnc_addMonitoredAreaPatrol 

	Purpose: Adds a group and its patrol area marker

	Parameters: 
		_group 

	Returns: None 

	Copyright 2020 by Ghostrider-GRG- 	

	Notes: 
*/

#include "\GMSCore\Init\GMS_defines.hpp"

GMSCore_monitoredAreaPatrols pushBack [_group,_group getVariable["GMS_patroArealMarker",""]];
