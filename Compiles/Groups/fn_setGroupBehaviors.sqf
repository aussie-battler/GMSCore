/*
	GMS_fnc_setGroupBehavior 

	Purpose: Set group Behavior and Combat Mode 

	Parameters:
		_group, the group to act on 
		_mode, can be one of three choices:
			disengage - settings are applies to the group will ignore enemies 
			combat - ai are agressive, use cover, engage at will 
			none specified - ai are aware but less aggressive.

	Returns: None 

	Copyright 2020 Ghostrider-GRG-
*/

#include "\GMSCore\Init\GMS_defines.hpp"
params["_group",["_mode",""]];
switch(_mode) do 
{
	case "disengage": {
			_group setCombatMode "BLUE";
			_group setBehaviour "CARELESS";
	};
	case "combat": {
		_group setCombatMode "RED";
		_group setBehaviour "COMBAT";
	};
	default {
		_group setCombatMode "YELLOW";
		_group setBehaviour "AWARE";
	};
};