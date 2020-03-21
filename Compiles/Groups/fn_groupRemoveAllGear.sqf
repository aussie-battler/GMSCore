/*
	GMS_fnc_groupRemoveAllGear
	Purpose: remove all gear from all units in a group. 
	copyright 2020 by Ghostrider-GRG0
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_group"];
{
	[_x] call GMS_fnc_unitRemoveAllGear;
}forEach (units _group);