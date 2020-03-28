/*
	fn_vehicleHit 
	Purpose: handle damage from collisions and friendly fire
*/

#include "\GMSCore\Init\GMS_defines.hpp"
if !(isServer) exitWith {};

private _unit = _this select 0;
//private _instigator = _this select 3;
private _group = group _unit;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";
// TODO: send information to nearby units ?
// Let GMSAI or GMS handle that.
