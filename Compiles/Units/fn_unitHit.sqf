/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
if !(isServer) exitWith {};

private _unit = _this select 0;
[group _unit,"combat"] call GMS_fnc_setGroupBehaviors;
// TODO: send information to nearby units ?
// let GMSAI or GMS handle that
_unit call GMS_fnc_healSelf;

