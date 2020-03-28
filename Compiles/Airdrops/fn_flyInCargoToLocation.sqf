/*
    GMS_fnc_flyInCargoToLocation 
    Purpose: 
        Spawns a transport heli , routes it to a location, the heli drops cargo specificed by an array, leaves and despawns.
    
    Parameters: aircraft class name, cargo (either a single item or array of items), drop location, spawn distance (options, default 2000 m)
        _airdropPos: Position at which to drop cargo which can be either paratroops or an object 
        _aircraftClassName: class name of the type of aircraft to use 
        _payload: the payload, either a group or object which may be prefilled with stuff 
        _allowDamage: true/false - when true, the aircraft used to fly in the payload can be damaged by players or AI 
        _visibleMarker: true/false - when true smoke or a chemlight will be deployed once the payload reaches ground (objects only)
        _mapMarker: true/false - when true, a temporary marker will be added at the location of the payload (objects only) 
        _mapMarkerDeleteTime: Number from 0 to infinity - how long to wait before deleteing the above map marker 
        _spawnDistance: number from 0 to infinity - how far from the drop position to spawn the aircraft 
    Returns: None 

    Copyright 2020 by Ghostrider-GRG-
*/
#include "\GMSCore\Init\GMS_defines.hpp"
//  [_pos,_aircraftType,_payloadObject,_allowDamage,_visibleMarker,_mapMarker,_mapMarkerDeleteTime,_spawnDistance] 
params["_airdropPos","_aircraftClassName","_payload",["_allowDamage",false],["_visibleMarker",true],["_mapMarker",true],["_mapMarkerDeleteTime",3000],["_spawnDistance",2000]];
//diag_log format["flyInCargoToLocation called at %1",diag_tickTime];
_labels = ["_airdropPos","_aircraftClassName","_payload","_allowDamage","_visibleMarker","_mapMarker","_mapMarkerDeleteTime","_spawnDistance"];
{
	//diag_log format["Value 3: _this select %1 = %2",_forEachIndex, _this select _forEachIndex, _labels select _forEachIndex];
}forEach _this;

private _spawnPos = (_airdropPos) getPos[_spawnDistance,random(359)];

_distanceToDropZone = _spawnPos distance _airdropPos;
private _aircraft = createVehicle[_aircraftType,_spawnPos,[],0,"FLY"];
_aircraft allowDamage false;
private _dir = _aircraft getRelDir (_airdropPos);
_adjustedDropPos = _airdropPos getPos[100,_dir];  // add a distance offset to account for the fact that in Arma waypoints for aircraft are complete at a radius of 100 m
_m = createMarker["rawDropPos",_airdropPos];
//_m setMarkerType "mil_dot";
//_m setMarkerText "Raw Drop Position";
//_m setMarkerColor "COLORBLACK";
//_m = createMarker["AdjDropPos",_adjustedDropPos];
//_m setMarkerType "mil_dot";
//_m setMarkerText "Adj Drop Position";
//_m setMarkerColor "COLORBLACK";
_aircraft setVariable["payload",_payload];
_aircraft setVariable["allowdamage",_allowdamage];
_aircraft setVariable["visibleMarker",_visibleMarker];
_aircraft setVariable["mapMarker",_mapMarker];
_aircraft setVariable["markerDeleteTime",_mapMarkerDeleteTime];
//_aircraft setVariable["dropPos",_airdropPos];
//_m = createMarker["spawnPos",_spawnPos];
//_m setMarkerType "mil_dot";
//_m setMarkerText "Spawn Position";
//_m setMarkerColor "COLORBLACK";
//diag_log format["flyInCargoToLocation: _spawnPos = %1",_spawnPos];
_aircraft setFuel 1;
_aircraft engineOn true;
_aircraft flyInHeight 75;
createVehicleCrew _aircraft;
_group = group(driver _aircraft);
{_x allowDamage false} forEach (crew _aircraft);
//_distanceToFirstWP = _distanceToDropZone - 500;
_deliverPayloadLocation = _airdropPos;
_wp1Distance = (_aircraft distance _airdropPos) - 125;
_wp1 = _group addWaypoint [position _aircraft getPos[_wp1Distance, _aircraft getRelDir (_airdropPos)],1,1,"targetappoach"];
_wp1 setWaypointPosition [position _aircraft getPos[_wp1Distance, _aircraft getRelDir (_airdropPos)],0];
_wp1 setWaypointStatements["true","this call GMS_fnc_selectDropWaypoint;"];
_aircraft setVariable["wp1Index",_wp select 1];
//////////////////////////////////////
//_wp2 = _group addWaypoint [_airdropPos, 1,2, "targetPosition"];
//_wp2 setWaypointSpeed "LIMITED";
//_wp2 setWaypointStatements ["true","this call GMS_fnc_arrivedOnStation;"];
//_aircraft setVariable["wp2Index",_wp2 select 1];
_wp3 = _group addWaypoint [_adjustedDropPos, 0, 3, "prepareDropoff"];
_wp3 setWaypointStatements["true","this call GMS_fnc_hoverAndDropoff;"];
_wp3 setWaypointSpeed "LIMITED";
_aircraft setVariable["dropCargoIndex",_wp3 select 1];
//_wp3 setWaypointTimeout [5,7,9];
_positionDespawn = (_airdropPos) getPos[1000,_dir];
//_m = createMarker["despawnPos",_positionDespawn];
//_m setMarkerType "mil_dot";
//_m setMarkerText "Despawn Here";
//_m setMarkerColor "COLORBLACK";
/////////////////////////////////////
_wp4 = _group addWaypoint[_positionDespawn,0,3,"despanPosn"];
_wp4 setWaypointStatements["true","this call GMS_fnc_cleanup;"];
_wp4 setWaypointSpeed "NORMAL";
_aircraft setVariable["finalWPIndex",_wp4 select 1];
_m = format["flyInCargoToLocation: currentWaypoint on script end =  %1",currentWaypoint _group];
//systemChat _m;
diag_log _m;