/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_vehicle","_crew",["_blockedTurrets",[]],["_blockedPositions",[]]];
//diag_log format["GMSCore] _loadVehiclePatrol: _vehicle = %1 | _crew = %2 | _blockedTurrets = %3",_vehicle,_crew,_blockedTurrets];
private _driver = _crew deleteAt 0;
_driver moveInDriver _vehicle;
private _turrets = allTurrets[_vehicle,false];
{
	if (_crew isEqualTo []) exitWith {};
	if (_vehicle weaponsTurret _x in _blockedTurrets) then
	{
		private _mags = _vehicle magazinesTurret _x;
		private _turret = _x;
		{
			_vehicle removeMagazinesTurret [_x,_turret]
		}forEach _mags;
	} else {
		private _gunner = _crew deleteAt 0;
		_gunner moveInTurret [_vehicle,_x];		
	};
} forEach _turrets;
private _turretsFFV = (allTurrets [_vehicle,true]) - (_turrets);
{
	if (_crew isEqualTo []) exitWith {};
	private _ffv = _crew deleteAt 0;
	_ffv moveInTurret [_vehicle,_x];
}forEach _turretsFFV;
private _empty = fullCrew[_vehicle,"cargo",true] select {_x select 0 isEqualTo objNull};
{
	if (_crew isEqualTo []) exitWith {};		
	private _unit = _crew deleteAt 0;
	_unit moveInCargo [_vehicle, _x select 2];
}forEach _empty;
