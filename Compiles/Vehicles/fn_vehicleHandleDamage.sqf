/*
	Scope Global 
*/
params ["_vehicle", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
if !(isPlayer _instigator) then 
{
	_vehicle setDamage 0;  
	_vehicle setHitPointDamage [_hitPoint, 0];
};