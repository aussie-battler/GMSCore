/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
private _unit = _this;
private _group = group _unit;

if ((damage _unit) > (_group getVariable["GMS_minDamageForHeal",0.4]) ) then
{
	private _maxHeals = _group getVariable ["GMS_maxHeals",1];
	private _healsDone = _group getVariable ["GMS_healsDone",0];
	if (_healsDone >= _maxHeals) exitWith {};
	private _smokeShell = _group getVariable["GMS_smokeShellOnHeal",""];
	if !(_smokeShell isEqualTo "") then {
		_smokeShell createVehicle (position _unit getPos[1,random(359)]);
	};
	_unit setVariable["hasHealed",true];
	_unit addItem "FAK";
	_unit action ["HealSoldierSelf", _unit];
	_unit setDamage 0;
	//uiSleep 1;
	if ("FAK" in (items _unit)) then {_unit removeItem "FAK"};
};

