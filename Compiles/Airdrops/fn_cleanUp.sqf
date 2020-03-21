/*
	fn_cleanup = {
*/
#include "\GMSCore\Init\GMS_defines.hpp"

_heli = vehicle _this;
[group _this] call GMS_fnc_despawnInfantryGroup;
deleteVehicle _heli;
