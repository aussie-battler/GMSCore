/*
	fn_dropPayload 
*/

#include "\GMSCore\Init\GMS_defines.hpp"
//systemChat "Heli Arrived On Station";
private["_marker","_smoke"];
params["_aircraft"];
private _payload = _aircraft getVariable "payload";
if (isNil "_payload") exitWith {};
_aircraft setVariable["payload",nil];
//_m = format["heli arrived on station, dropPayload called with heli = %1 and payload = %2",_aircraft,_payload];
//systemChat _m;
//diag_log _m;
private _allowDamage = _aircraft getVariable "allowdamage";
private _visibleMarker = _aircraft getVariable "visibleMarker";
private _mapMarker = _aircraft getVariable ["mapMarker",false];
//private _dropPos = _aircraft getVariable["dropPos",getPos _aircraft];

private _dropHeight = ((getPosATL _aircraft) select 2) - 15;
private _minDropHeight = 50;
if (_dropHeight < _minDropHeight) then {_dropHeight = _minDropHeight};
//_m = format["aircraft altitude = %1 | dropHeight = %2",(getPos _aircraft) select 2,_dropHeight];
//systemChat _m;
//diag_log _m;

_pos = [(position _aircraft) select 0,  (position _aircraft) select 1, _dropHeight]; 
_chute = createVehicle ["I_Parachute_02_F",[0,0,_dropHeight],[],0,"FLY"];
//_payload setPos  [_pos select 0,_pos select 1,(_pos select 2) - 3];
_chute setPosATL _pos;
_payload allowDamage false;
_payload attachTo [_chute, [0, 0, -1.3]];
//_m = format["_aircraft altitude = %1 | payload altitude = %2 | chute altitued %3",(getPosATL _aircraft) select 2,(getPosATL _payload) select 2,(getPosATL _chute) select 2];
//systemChat _m;
//diag_log _m;	
if !(_aircraft getVariable["PayloadDelivered",false]) then
{
	//diag_log "=================";
	//diag_log "payload delivered";
	_aircraft setVariable["PayloadDelivered",true];
};	
private _dimensions = [_payload] call GMS_fnc_getDimensions;
private _releaseHeight = (_dimensions select 2) + 3;
//_m = format["_releaseHeight = %1",_releaseHeight];
//systemChat _m;
//diag_log _m;	
while {(getPosATL _payload) select 2 > _releaseHeight} do {_time = diag_tickTime;waitUntil {(diag_tickTime - _time) > 2}};
detach _payload;
deleteVehicle _chute;
_pos = getPosATL _payload;
_payload setPosATL[_pos select 0,_pos select 1,0.2];
_payload setVectorUp[0,0,1];
//uiSleep 1;
if (_allowDamage) then {_payload allowDamage true};
if (_visibleMarker) then {[_payload,300] call GMS_fnc_visibleMarker};
//diag_log format["fn_dropPayload: _mapMarker = %1",_mapMarker];
if (_mapMarker) then 
{
	_marker = createMarker[format["payload%1",_payload],getPos _payload];
	_marker setMarkerPos (getPos _payload);
	_marker setMarkerType "hd_dot";
	_marker setMarkerColor "COLORBLACK";
	_marker setMarkerText "Supplies";
	_m = format["fn_dropPayload:  _marker = %1",_marker];
	GRGCore_monitoredMarkers pushBack [_marker,_aircraft getvariable["markerDeleteTime",300]];
};
// push the marker to list of monitored markers GMS_var_monitoredMarkers pushBack [_marker, _aircraft getVariable "markerDeleteTime"];
	
	