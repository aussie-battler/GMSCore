/*
	GMS_ fnc_vehicleHit 
	
	Purpose: called when the GMS MPHit EH is fired for the vehicle to handle allerting crew to enemy activities. 

	Parameters: per https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#MPHit  

	Returns: None 

	Copyright 2020 by Ghostrider-GRG-

	Notes: TODO: check the parameters here to be sure they are correct.	
*/

#include "\GMSCore\Init\GMS_defines.hpp"

private _unit = _this select 0;
//private _instigator = _this select 3;
private _group = group _unit;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";
// TODO: send information to nearby units ?
// Let GMSAI or GMS handle that.
