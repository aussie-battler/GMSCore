/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_object"];

{
    _object removeAllMPEventHandlers _x;
} forEach ["MPHit","MPKilled"];