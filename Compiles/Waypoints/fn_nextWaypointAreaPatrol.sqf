/*
	GMS_fnc_nextWaypointAreaPatrol 

	Purpose: set the next waypoint for a grou patroling within a proscribed area set by a map marker 

	Parameters:
		_this: leader of the group to handle 

	Returns: None 

	Copyright 2020 by Ghostrider-GRG- 	
*/
#include "\GMSCore\Init\GMS_defines.hpp"
private _leader = _this;
private _group = group _leader;
private _target = _group getVariable["target",objNull];
[_group] call GMS_fnc_setWaypointLastCheckedTime;
private _patrolAreaMarker = _group getVariable["GMS_patroArealMarker",""];
[format["GMS_fnc_nextWaypointAreaPatrol called for group %1 at time %2 with _patrolAreaMarker = %3",_group,diag_tickTime,_patrolAreaMarker]] call GMS_fnc_log;
if (_patrolAreaMarker isEqualTo "") exitWith 
{
	[format["No Marker Defined for Patrol Area for group %1",_group],"error"] call GMS_fnc_log;
};

private _nearestEnemy =  _leader findNearestEnemy (position (_leader));
private _blacklisted = _group getVariable "GMS_blackListedAreas";
private _target = _group getVariable["GMS_target",objNull];

private _patrolAreaCenter = markerPos _patrolAreaMarker;
private _patrolAreaSize = markerSize _patrolAreaMarker;
//private _patrolAreaShape = markerShape _patrolAreaMarker;

if (_group getVariable["GMS_antiStickPatrol",false]) exitWith 
{
	// Group needs to be unstuck. (redirected or disengaged from combat and moved.)
	[format["GMS_fnc_nextWaypoint : anti_stuck condition : unsticking  _group = %1",_group]] call GMS_fnc_log;	
	[_group,"disengage"] call GMS_fnc_setGroupBehaviors;
	_group setSpeedMode "NORMAL";
	private _wp = [_group,0];
	_wp setWaypointPosition (markerPos _patrolAreaMarker);
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointCombatMode "YELLOW";
	_group setVariable["GMS_antiStickPatrol",false];
	_group setCurrentWaypoint _wp;
};

if (isNull _target || !(alive _target)) then
{
	_target =  _leader findNearestEnemy (position (_leader));
	_group setVariable["GMS_target",_target];
};
// Hunting waypoints
if !(isNull _target) then
{
	[format["GMS_fnc_nextWaypoint : enemies nearby condition : _group = %1",_group]] call GMS_fnc_log;
	private _wp = [_group,0];
	private _nextPos = (position _target) getPos [
		(selectMax [(_leader distance _target)/2,10]),// keep the AI at least 10 m from the target
		(_leader getRelDir (position _target)) + (random(25) * selectRandom[-1,1])
		];

	// Try to keep the patrol from wandering too far outside the designated patrol area, e.g., chasing players across the map
	if !([_patrolAreaCenter,_patrolAreaSize,_nextPos] call BIS_fnc_isInsideArea) then {_nextPos = _patrolAreaCenter};
	diag_log format["_nextWaypoint: enemies detected, configuring SAD waypoint at _nextPos = %1",_nextPos];	
	_group setVariable["GMS_timeStamp",diag_tickTime];	
	_group setVariable["GMS_target",_target];
	_group reveal[_target,1];

	_wp setWaypointPosition [_nextPos,0];
	_wp setWaypointType "SAD";
	_wp setWaypointTimeout [45,60,75];	
	_group setCurrentWaypoint _wp;
	[_group, "combat"] call GMS_fnc_setGroupBehaviors;
	_group setSpeedMode "SLOW";
	_group setCurrentWaypoint _wp;	
	diag_log format["_nextWaypoint: waypoint for group %1 updated to SAD waypoint at %2",_group,_nextPos];

// Patrol waypoints	
} else {
	private _groupPatrolArea = [_patrolAreaCenter, [markerSize _patrolAreaMarker select 0,markerSize _patrolAreaMarker select 1,0,true]];	
	//params["_areaMarker","_noPositionsToFind",["_units",[]],["_separation",100],["_blackList",[]]];
	private _nextPos = [_groupPatrolArea,1,[_leader],35,_blacklisted] call GMS_fnc_findRandomPosWithinArea select 0;	
	diag_log format["_nextWaypointInfantry: NO enemy neaarby | _groupPatrolArea = %1 | _nextPos = %2",_groupPatrolArea, _nextPos];	
	_group setVariable["timeStamp",diag_tickTime];
	private _wp = [_group, 0];
	_wp setWaypointPosition [_nextPos,5];
	_wp setWaypointSpeed (_group getVariable "GMSAI_waypointSpeed");
	_wp setWaypointLoiterRadius (_group getVariable "GMSAI_waypointLoiterRadius");
	_wp setWaypointType "MOVE";
	//_wp setWaypointLoiterType "CIRCLE";
	_wp setWaypointStatements ["true","this call GMSAI_fnc_nextWaypoint;"];
	_wp setWaypointTimeout  [5,7,9];
	_group setCurrentWaypoint _wp;
	_group setSpeedMode "NORMAL";
	diag_log format["_nextWaypoint: waypoint for group updated to LOITER waypoint at %2",_group,_nextPos];
};

/*
		Logic: If enemies known to the group are neaby, approach a random position close to the nearest enemy else move to a random location within the area to be patrolled and loiter for a period (30 secs);
*/