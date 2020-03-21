/*
	GMS_fnc_getIntegerFromRange

	Purpose: to find a random integer within a specified removeMagazineGlobal
	Parameters: _data, the range to be used in the format [_min,_max]; [_min] or _min will return the rounded off value of _min; if _min == _max, the rounded off value of _min is returned.
	Return: an integer within the range.
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_data"];
_value = round([_data] call GMS_fnc_getNumberFromRange);
//diag_log format["_getIntegerFromRange: _this = %1 | _data = %2 | _value = %3",_this,_data,_value];
_value