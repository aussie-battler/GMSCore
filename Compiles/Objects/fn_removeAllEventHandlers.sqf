/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params[
	"_object",
	["_eh",["Reloaded","Fired","FiredNear","GetIn","GetOUt","HandleDamage"]]
];
//diag_log format["_removeEventHandlers: _object = %1 | _eh = %2",_object,_eh];
{
	_object removeAllEventHandlers _x;
} forEach _eh;