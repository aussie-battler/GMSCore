/*
	GMS_fnc_unitKilled 

	Purpose: called when the MPKilled eventhander fires for the unit   

	Parameters: per https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#MPKilled 

	Returns: none 

	Copyright 2020 by Ghostrider-GRG-
*/

#include "\GMSCore\Init\GMS_defines.hpp"

params["_unit","_killer","_instigator"];
[format["GMS_fnc_unitKilled: _unit = %1 | _killer = %2",_unit,_killer]] call GMS_fnc_log;

private _cleanupTimer = (group _unit) getVariable["GMS_bodyCleanupTime",600];
[_unit,_cleanupTimer] call GMS_fnc_addObjectsToDeletionCue;
[_unit] call GMS_fnc_removeAllEventHandlers;
[_unit] call GMS_fnc_removeAllMPEventHandlers;
_unit disableAI "ALL";

//private _removeLauncher = _group getVariable["GMS_removeLauncher",true];
if (_group getVariable["GMS_removeLauncher",true]) then 
{
	_unit call GMS_fnc_removeLauncher;
};
//private _removeNVG = _group getVariable["GMS_removeNVG",true];
if (_group getVariable["GMS_removeNVG",true]) then 
{
	_unit call GMS_fnc_removeNVG;
};

if !((vehicle _unit) isKindOf "Man") then 
{

if (local _unit) then 
{
	_unit action ["Eject",vehicle _unit];  // can probably remoteexec this from the server 
} else {
	// remoteExec the eject action
};
	if (crew (vehicle _unit) isEqualTo []) then 
	{
		[vehicle _unit] call GMS_fnc_allowPlayerAccess;  // check if vehicle is empty and if so handle it.
	};
};

if (units (group _unit) isEqualTo []) then 
{
	deleteGroup (group _unit);
} else {
	[group _unit,"combat"] call GMS_fnc_setGroupBehaviors;
	// TODO: send information to nearby units ?
};
[_unit] joinSilent GMS_graveyardGroup;

// TODO: Add runover checks ?