/*
	GMS_fnc_unitCanSee 

	Purpose: determine if a unit has a clear line of sight to an object or 'can see it'

	Parameters;
		_unit, the unit to test 
		_obj, the object we want to know about 

	Returns: true/false where true means there is an unobstructed line of sight from the unit to the object.

	Copyright 2020 by Ghostrider-GRG-
*/

params["_unit","_obj"];
private _veh = vehicle _unit;
private _canSee = if (lineIntersects[eyePos _unit, _obj,aimpos _veh]) then {false} else {true};
_canSee
