params["_group","_obj"];
private _veh - vehicle (leader _group);
private _canSee = false;
{
	if !(lineIntersects[eyePos _x, _obj, aimPos _veh]) exitWith {_canSee = true};
} forEach (units _group);
_canSee