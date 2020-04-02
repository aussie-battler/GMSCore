/*
	GMS_fnc_initializeWaypointsAreaPatrol 
	
	Purpose: Can be used to configure a patrol area for any kind of group (infantry, land, air sea)

	Parameters:
		_group, the group to configure 
		_blackListed, areas the AI should avoid 
		_patrolAreaMarker, a marker defining the patrol area 
		_timeout, // The time that must elapse before the antistuck function takes over.

	Returns: None 

	Copyright 2020 by Ghostrider-GRG- 	

	Notes:
		By completing waypoints set within the area proscribed by the marker, the group will move about within the area circumscribed by the parameters below moving from one randome location to the next.
		If an enemy is identified, it will move toward that enemy and try to engage.
		If the group monitor determines tha ta group is 'stuck' meaning has not rotated waypoints within some proscribed period, the group will be disengaged and returned to the center of the patrol area.		
*/

#include "\GMSCore\Init\GMS_defines.hpp"
params["_group",  // group for which to configure / initialize waypoints
		["_blackListed",[]],  // areas to avoid within the patrol region
		["_patrolAreaMarker",""],  // a marker defining the patrol area center, size and shape
		["_timeout",300]
	];  

if (GMS_debug >=1) then 
{
	[format["_patrolAreaMarker = %1 | typeName _patrolAreaMarker = %2",_patrolAreaMarker, typeName _patrolAreaMarker],"information"] call GMS_fnc_log;

	if (_patrolAreaMarker isEqualTo "" || !(typeName _patrolAreaMarker isEqualTo "STRING")) exitWith {
		[format["No valid Marker Provided in Call To initializeWaypointsAreaPatrol"],"error"] call GMS_fnc_log;
	};
};

[format["_fnc_initializeWaypoints called for group %1",_group]] call GMS_fnc_log;
GMSCore_monitoredGroups pushBackUnique _group;
_group setVariable["GMS_patrolTimeout",_timeout];
//private _marker = createMarker[format["GMS_waypoint%1",_group],_center];
_group setVariable["GMS_patroArealMarker",_patrolAreaMarker];
_group setVariable["GMS_blackListedAreas",_blacklisted];
private _wp = [_group,0];
_wp setWaypointStatements ["true","this call GMS_fnc_nextWaypointAreaPatrol;"];	
[_group] call GMS_fnc_addMonitoredAreaPatrol;  //  Add the group to the list of groups that are checked for 'stuck' conditions and for cleanup of markers when the group is deleted
(leader _group) call GMS_fnc_nextWaypointAreaPatrol;
[_group,""] call GMS_fnc_setGroupBehaviors;
[format["GMS_fnc_initializeWaypointsAreaPatrol Completed for group %1",_group]] call GMS_fnc_log;