/*
	GMS_fnc_destroyVehicleAndCrew 

	Parameters: _vehicle with crew to be destroyed

	Returns: None 

	Copyright 2020 by Ghostrider-GRG- 

	Notes: 	None	
*/

params["_vehicle"];
private _group = group((crew _vehicle) select 0);
{
	_vehicle deleteVehicleCrew _x;
};
deleteVehicle _vehicle;