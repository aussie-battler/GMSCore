// 
/*
	GMS_fnc_deleteObjectMethod

	should be able to handle any object including old mission objects, crates, mission vehicles, mission AI bodies, and so forth.
	This was set up so that the reference can either be an object itself or an array of objects, such as a list of mission objects due to be deleted.
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_objectParameters"];

if (typeName _objectParameters isEqualTo "ARRAY") then 
{
	{[_x] call GMS_fnc_deleteObjectMethod} forEach _objectParameters;  //  One itteration of recursion should be ok (fingers crossed).
} else {
	if (typeName _objectParameters isEqualTo "OBJECT") then 
	{
		deleteVehicle _objectParameters;
	} else {
		if (typeName _objectParameters isEqualTo "GROUP") then 
		{
			[_objectParameters] call GMS_fnc_despawnInfantryGroup;
		};
	};
};
true