/*
	updates the timestamp on a group 
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_group",["_time",diag_tickTime]];
_group setVariable["GMS_lastChecked",_time];
true