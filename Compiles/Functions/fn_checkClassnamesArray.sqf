/*

	GMS_fnc_checkClassnNmesArray

	Purpose: to validate classnames used for AI gear or other puposes

	Parametsrs:
		_classnames: an array of strings, each representing a possible className

	Returns: the array with invalid classnames removed and logged.

	Copyright 2020 by Ghostrider-GRG-
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_classNames"];
private _return = [];
if (count(_classNames select 1) == 2) then
 {
	 _return = [_classNames] call GMS_fnc_checkClassnamesWeightedArray;
} else {

	{
		if ([_x] call GMS_fnc_isClass) then 
		{
			_return pushBack _x;
		} else {
			diag_log format["[GMSCore] fn_checkClassNames: invalid classname %1",_x];
		};
	} forEach _classNames;
};
_return