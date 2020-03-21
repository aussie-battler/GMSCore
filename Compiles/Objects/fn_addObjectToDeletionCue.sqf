/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_object","_deletionDelay"];
[format["GMS_fnc_addObjectToDeletionCue: _object = %1 | _deletionDelay = %2",_object,_deletionDelay]] call GMS_fnc_log;
GRGCore_monitoredObjects pushBack [_object,diag_tickTime + _deletionDelay];
true