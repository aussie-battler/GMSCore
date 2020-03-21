/*
	GMS_fnc_unitCanSee 
	Purpose: test if a unit can see an object or player meaning there are no interfering objects.
*/

params["_unit","_object"];
private _veh = vehicle _unit;
private _int = lineIntersects[eyePos _unit, _object, aimPos _veh];
private _canSee = if (_int) then {false} else {true};
_canSee

