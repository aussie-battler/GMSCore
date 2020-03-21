/*
	GMS_fnc_spawnInfantryGroup

	Purpose: spawn a group of N infantry units as a specified position.

	Parameters
		_groupPos: postion at which to spawn the overall group; individual units will be spawned at safe spots in the region of the group position.
		_units: number of units to spawn for the group.
		_side: side on which the group is spawned.
		_baseSkill: base skill for the group 
		_alertDistance: distance within which nearby units or groups are alerted to enemy activity by the group 
		_intelligence: the increment in awareness upon each discovery of an enemy - higher values mean more skilled AI as far as finding enemy players.
		_alertDistance: how far to search for players that the group should know about.
		
	Return: the group that was spawned.
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_pos","_units",["_side",GMS_side],["_baseSkill",0.7],["_alertDistance",500],["_intelligence",0.5]];
private _p = ["_pos","_units","_side","_baseSkill","_alertDistance","_intelligence","_monitor"];
/*
{
	diag_log format["GMS_fnc_spawnInfantryGroup:   %1 = %2",_p select _forEachIndex, _x];
} forEach _this;
*/
//  [format["GMS_fnc_spawnInfantryGroup: _groupPos = %1 | _units = %2 | _side = %5 | _alertDistance = %3 | _intelligence = %4 | _side %5",_pos,_units,_alertDistance,_intelligence,_side]] call GMS_fnc_log;
private _group = [_side] call GMS_fnc_createGroup;
_group setVariable["GMS_patrolAlertDistance",_alertDistance];
_group setVariable["GMS_patrolIntelligence",_intelligence];
_players = _pos nearEntities["Man",_alertDistance] select {isPlayer _x};
{_group reveal[_x,_intelligence]} forEach _players;

for "_i" from 1 to _units do
{
	private["_unit"];
	GMS_unitType createUnit [_pos, _group, "_unit = this", _baseSkill, "COLONEL"];
	if (GMS_modType isEqualTo "Epoch") then {_unit setVariable ["LAST_CHECK",28800,true]};
	_unit addMPEventHandler["MPKilled",{_this call GMS_fnc_unitKilled;}];
	_unit addMpEventHandler["MPHit",{_this call GMS_fnc_unitHit;}];
	_unit addEventHandler["Reloaded",{_this call GMS_fnc_unitReloaded;}];
	//diag_log format["_fn_spawnInfantryGroup: _unit = %1 | side _unit = %2",_unit,side _unit];	
};

diag_log format["_fnc_spawnInfantryGroup: side _group = %1",side _group];
_group

