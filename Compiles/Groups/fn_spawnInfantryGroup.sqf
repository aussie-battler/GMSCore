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
		_bodycleanuptimer: how long to wait before deleted the corpse 
		_maxReloads: how many times the unit is allowed to reload its weapon; -1 for infinite reloads 
		_removeLaunchers: true/false, whether launchers should be removed upon AI death 
		_removeNVG: true/false, wether NVG are removed on AI death 
		_minDamageToHeal: what the damage value from 0..1 should be to trigger the heal mechanic (default 0.4)
		_smokeShell: the type of smoke shell the unit throws before healing, use "" for none (default none)
		_maxHeals: how many times a unit is allowed to head (default, 1)

	Return: the group that was spawned.

	Copyright 2020 Ghostrider-GRG-
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params[
		"_pos",  // center of the area in which to spawn units
		"_units",  // Number of units to spawn
		["_side",GMS_side],
		["_baseSkill",0.7],
		["_alertDistance",500], 	 // How far GMS will search from the group leader for enemies to alert to the kiillers location
		["_intelligence",0.5],  	// how much to bump knowsAbout after something happens
		["_bodycleanuptimer",600],  // How long to wait before deleting corpses for that group
		["_maxReloads",-1], 			// How many times the units in the group can reload. If set to -1, infinite reloads are available.
		["_removeLaunchers",true],
		["_removeNVG",true],
		["_minDamageToHeal",0.4],
		["_maxHeals",1],
		["_smokeShell",""]
	];
private _p = ["_pos","_units","_side","_baseSkill","_alertDistance","_intelligence","_bodycleanuptimer","_maxReloads","_removeLaunchers","_removeNVG","_minDamageToHeal","_maxHeals","_smokeShell"];

{
	diag_log format["GMS_fnc_spawnInfantryGroup:   %1 = %2",_p select _forEachIndex, _x];
} forEach _this;

//  [format["GMS_fnc_spawnInfantryGroup: _groupPos = %1 | _units = %2 | _side = %5 | _alertDistance = %3 | _intelligence = %4 | _side %5",_pos,_units,_alertDistance,_intelligence,_side]] call GMS_fnc_log;
private _group = [_side] call GMS_fnc_createGroup;
_group setVariable["GMS_patrolAlertDistance",_alertDistance];
_group setVariable["GMS_patrolIntelligence",_intelligence];
_group setVariable["GMS_bodyCleanupTime",_bodycleanuptimer];
_group setVariable["GMS_maxReloads",_maxReloads];
_group setVariable["GMS_removeLauncher",_removeLaunchers];
_group setVariable["GMS_removeNVG",_removeLaunchers];
_group setVariable["GMS_maxHeals",_maxHeals];
_group setVariable["GMS_minDamageForHeal",_minDamageToHeal];
_group setVariable["GMS_smokeShell",_smokeShell];

_players = _pos nearEntities["Man",_alertDistance] select {isPlayer _x};
{_group reveal[_x,_intelligence]} forEach _players;


for "_i" from 1 to _units do
{
	private["_unit"];
	GMS_unitType createUnit [_pos, _group, "_unit = this", _baseSkill, "COLONEL"];
	if (GMS_modType isEqualTo "Epoch") then {_unit setVariable ["LAST_CHECK",28800,true]};
	_unit enableAI "ALL";
	//diag_log format["_fn_spawnInfantryGroup: _unit = %1 | side _unit = %2",_unit,side _unit];	
};
_group call GMS_fnc_addUnitEventHandlers;

diag_log format["_fnc_spawnInfantryGroup: side _group = %1",side _group];
_group

