/*
	GMS_fnc_addUnitEventHandlers 

	Purpose: Adds the basic GMS event handlers to units 

	Parameters:
		_this is the _group to add the EH to 

	Returns: None 

	Copyright 2020 by Ghostrider-GRG-
*/

private _group = _this;
{
	_x addMPEventHandler["MPKilled",{_this call GMS_fnc_unitKilled;}];  // Bare minimum killed EH
	_x addMpEventHandler["MPHit",{_this call GMS_fnc_unitHit;}];			// bare minimum hit EH
	_x addEventHandler["Reloaded",{_this call GMS_fnc_unitReloaded;}];	// Handle all reloads up to the max reloads set for the group
} forEach (units _group);