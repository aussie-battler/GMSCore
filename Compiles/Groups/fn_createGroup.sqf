/*

    GMS_fnc_createGroup 
    Purpose: create a group on the side set in params 
    params: ["_side",GMS_side];
    Return: group created.

    Copyright 2020 by Ghostrider-GRG-
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params[["_side",GMS_side],["_monitor",false]];
[format["<INFORMATION> function GMS_fnc_createGroup: _this = %1",_this]] call GMS_fnc_log;
private _group = createGroup [_side,true];
if (_monitor) then {GMSCore_monitoredGroups pushBackUnique _group};
[format["function GMS_fnc_createGroup: _group = %1",_group]] call GMS_fnc_log;
if (isNil "GMS_graveyardGroup") then 
{
    GMS_graveyardGroup = createGroup[_side,false];  // used to store dead units until they are Deleted 
    GMS_graveyardGroup setGroupId ["GMS_graveyard"];
};
_group