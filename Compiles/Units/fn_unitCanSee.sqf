

params["_unit","_obj"];
private _veh = vehicle _unit;
private _canSee = if (lineIntersects[eyePos _unit, _obj,aimpos _veh]) then {false} else {true};
_canSee
