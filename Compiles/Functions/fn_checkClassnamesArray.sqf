/*

	GMS_fnc_checkClassnNmesArray

	Purpose: to validate classnames used for AI gear or other puposes

	Parametsrs:
		_classnames: an array of strings, each representing a possible className

		_return: the array with invalid classnames removed and logged.

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_classNames"];

private _return = [];
{
	if ([_x] call GMS_fnc_isClass) then 
	{
		_return pushBack _x;
	} else {
		diag_log format["[GMSCore] fn_checkClassNames: invalid classname %1",_x];
	};
} forEach _classNames;

_return