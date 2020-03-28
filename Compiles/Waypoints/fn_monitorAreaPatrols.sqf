
/*
	GMS_fnc_monitorAreaPatrols 

	Purpose: Checks for groups that have not reached their waypoints within a proscribed period
	and redirects them.

	Parameters: None 

	Returns: None 

	Copyright 2020 by Ghostrider-GRG- 
*/

// TODO: Test functionality of this
#include "\GMSCore\Init\GMS_defines.hpp"
[format["GMS_fnc_monitorAreaPatrols called at %1 with %2 groups to monitor",diag_tickTime,count GMSCore_monitoredAreaPatrols]] call GMS_fnc_log;
for "_i" from 1 to (count GMSCore_monitoredAreaPatrols) do 
{
	if (_i > (count GMSCore_monitoredAreaPatrols)) exitWith {};
	private _patrol = GMSCore_monitoredAreaPatrols deleteAt 0;
	_patrol params["_group","_patrolArea"];
	if (isNull (_group)) then 
	{
		// group is empty or delete so lets clean up anything associated with it.
		[format["GMS_fnc_monitorAreaPatrols: deleted markers for a Null group"]] call GMS_fnc_log;
		deleteMarker (_patrol select 1);
	} else {
		if ( ({alive _x} count (units _group) > 0) ) then
		{
			private _timeStamp = [_group] call GMS_fnc_getWaypointLastCheckedTime;			
			private _elapsed = diag_tickTime - _timeStamp;

			if (_elapsed > _group getVariable["GMS_patrolTimeout",60]) then 
			{
				private _patrolAreaMarker = _group getVariable "GMS_patroArealMarker";
				private _patrolAreaCenter = markerPos _patrolAreaMarker;
				private _patrolAreaSize = markerSize _patrolAreaMarker;
				if !([_patrolAreaCenter,_patrolAreaSize,getPos(leader _group)] call BIS_fnc_isInsideArea) then 
				{
					[format["GMS_fnc_monitorAreaPatrols group %1 stuck",_group]] call GMS_fnc_log;
					[_group,true] call GMS_fnc_setWaypointStuckValue;
					(leader _group) call GMS_fnc_nextWaypointAreaPatrol;
				} else {
					(leader _group) call GMS_fnc_nextWaypointAreaPatrol;
				};
			} else {
				// Nothing to do here, let the group try to complete the waypoint
				//[format["GMS_fnc_monitorAreaPatrols group %1 last checked timestamp updated",_group]] call GMS_fnc_log;
				//[_group] call GMS_fnc_setWaypointLastCheckedTime;
			};
		};
		GMSCore_monitoredAreaPatrols pushBack _patrol;
	};
};


