/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
if !(isServer) exitWith {};
private ["_unit","_instigator","_group","_wp"];
_unit = _this select 0;
_instigator = _this select 3;
_group = group _unit;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";
// TODO: send information to nearby units ?

if (_unit getVariable ["GMS_hasHealed",false]) exitWith {};
if ((damage _unit) > 0.4 ) then
{
	_unit setVariable["hasHealed",true,true];
	"SmokeShellRed" createVehicle (position _unit getPos[1,random(359)]);
	_unit addItem "FAK";
	_unit action ["HealSoldierSelf",  _unit];
	_unit setDamage 0;
	//uiSleep 1;
	if ("FAK" in (items _unit)) then {_unit removeItem "FAK"};
};

