/*
fn_boostAtributes 

gives a small increase in skills to group units.

employed optionally when group is down to 1 unit.

Parameters:
	_group 
	_overallskillincrement - default 0.1 
	_subskills [] increment - default - accuracy 0.5, all other skill 0.1 
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_group",["_subskillIncrement",-.05]];
{
	private _unit = _x;
	{
		_unit setSkill[_x,((_unit skill _x) + _subskillIncrement)];
	} forEach ["aimingAccuracy","aimingSpeed","aimingShake","spotDistance","spotTime","courage","reloadSpeed","commanding"];
}forEach (units _group);