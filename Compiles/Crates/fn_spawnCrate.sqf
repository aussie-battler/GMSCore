/*
    spawn an object, normally a container of some sort, at a location or at [0,0,0] if none specified.
    params: classname of crate, location 
    return: object created of classname specified with all inventory removed 
*/
#include "\GMSCore\Init\GMS_defines.hpp"

params["_className",["_location",[0,0,0]]];
private _crate = _className createVehicle _location;
_crate call GMS_fnc_emptyObjectInventory;
_crate