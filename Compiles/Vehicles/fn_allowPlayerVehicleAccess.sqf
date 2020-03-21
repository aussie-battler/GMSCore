/*
	Configure a vehicle to allow players access
	This code should be broadcast ?
*/

#include "\GMSCore\Init\GMS_defines.hpp"
params["_veh"];
_veh enableRopeAttach true;
_veh enableCoPilot true;
if (local _veh) then // only bother to fire this on the machine on which the vehicle is local
{
	_veh lock 1;
};
true