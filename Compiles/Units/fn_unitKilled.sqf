/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_unit","_killer","_instigator"];
[format["GMS_fnc_unitKilled: _unit = %1 | _killer = %2",_unit,_killer]] call GMS_fnc_log;
if (hasInterface || !(hasInterface || isDedicated)) exitWith // Only run this on HC or clients 
{
	if (local _unit) then // Only run it on the client to which the unit is local
	{
		// soldierOne action ["Eject", vehicle soldierOne];
		if !((vehicle _unit) isKindOf "Man") then 
		{
			_unit action["Eject", vehicle _unit];
			[vehicle _unit] call blck_fnc_checkForEmptyVehicle;
		};
	};
};

private _cleanupTimer = (group _unit) getVariable["GMS_bodyCleanupTime",600];
[_unit,_cleanupTimer] call GMS_fnc_addObjectsToDeletionCue;
[_unit] call GMS_fnc_removeAllEventHandlers;
[_unit] call GMS_fnc_removeAllMPEventHandlers;
_unit disableAI "ALL";

if (units (group _unit) isEqualTo []) then 
{
	deleteGroup (group _unit);
} else {
	private _group = group _unit;	
	_group setBehaviour "COMBAT";
	_group setCombatMode "RED";
	// TODO: send information to nearby units ?
};
[_unit] joinSilent grpNull;

