/*

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