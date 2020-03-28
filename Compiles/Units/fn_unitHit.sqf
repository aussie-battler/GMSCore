/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
if !(isServer) exitWith {};

private _unit = _this select 0;
// private _instigator = _this select 3;
private _group = group _unit;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";
// TODO: send information to nearby units ?
// let GMSAI or GMS handle that
_unit call GMS_fnc_healSelf;

