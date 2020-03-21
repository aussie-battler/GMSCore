/*

	GMS_fnc_checkClassnamesWeightedArray

	Purpose: to validate classnames in a weighted array used for AI gear or other puposes
	Notes: Array format is assumed to be "classname",weight,"classname2",weight2 ...

	Parametsrs:
		_classnames: an array of strings, each representing a possible className

		_return: the array with invalid classnames logged and removed.

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_classNames"];

private _return = [];
{
	private _element = _x;
	_element params["_item","_weight"];
	if ([_item] call GMS_fnc_isClass) then 
	{
		_return pushBack [_item,_weight];
	} else {
		diag_log format["[GMSCore] fn_checkClassNames: invalid classname %1",_x];
	};
} forEach _classNames;

_return