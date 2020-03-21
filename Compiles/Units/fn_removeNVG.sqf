/*
    GMS_fnc_removeNVG

    Prupose: remove NVG from unitAddons

    Parameter: 
        __unit: the unit to be processed

    Return: none

    
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_unit"];
private _nvg = _unit getVariable["GMS_nvg",""];
if !(_nvg isEqualTo "") then
{
    _unit unassignitem _nvg; 
    _unit removeweapon _nvg;
};