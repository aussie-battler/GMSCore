/*

_unit addMagazine _newMagazine select 0;
diag_log format["_processUnitReloaded: _unit %1  _weapon %2  _newMagazine %3",_unit,_weapon,_newMagazine select 0];

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];

private _maxReloads = (group _unit) getVariable["GMS_maxReloads",-1];
if (_maxReloads isEqualTo -1) exitWith 
{
	(_unit) addMagazine (_newMagazine);
	[format["_unitReloaded:: one magazine of type %1 added to inventory of unit %2",newMagazine,unit]] call GMS_fnc_log;
};

private _reloads = (_unit) getVariable ["GMS_reloads",0];
if (_reloads >= _maxReloads) exitWith {};
(_unit) addMagazine (newMagazine);
(_unit) setVariable["GMS_reloads",_reloads + 1];
[format["_unitReloaded:: one magazine of type %1 added to inventory of unit %2",newMagazine,unit]] call GMS_fnc_log;
