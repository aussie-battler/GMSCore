

params["_items","_blacklist"];
private _filtered = [];
if (count _items select 0) == 2) then 
{
	{
		if !((_x select 0) in _blacklist) then {_filtered pushBack _x} else {[format[" removing blacklisted itemd: %1",_x select 0],'warning'] call GMS_fnc_log};
	} forEach _items;
} else {
	{
		if !(_x in _blacklist) then {_filtered pushBack _x}else {[format[" removing blacklisted itemd: %1",_x],'warning'] call GMS_fnc_log};
	} forEach _items;
};
_filtered