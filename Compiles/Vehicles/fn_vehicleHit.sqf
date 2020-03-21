/*
	fn_vehicleHit 
	Purpose: handle damage from collisions and friendly fire
*/

#include "\GMSCore\Init\GMS_defines.hpp"
params["_veh","_causedBy","_damage"];
//diag_log format["_fnc_HandleAIVehicleHit:  _veh = %1 | _instigator = %2",_veh,_instigator];

if (!(isPlayer _instigator)) exitWith 
{
	_veh setDamage ((damage _veh) - _damage;  // No damage from collisions or friendly fire.
};
true