/*
        drop a crate at a specific location
        parameters: crate (an object), location (default height 125 m)
        Return: true
*/
// TODO: Not used: delete ?
#include "\GMSCore\Init\GMS_defines.hpp"
params["_crates","_location",["_height",125]];
	private ["_crates","_marker","_markers","_blck_localMissionMarker","_location","_airborneCrates","_curPosCrate"];
	_crates = _this select 0;	
	_markers = [];
	
	{
		// params["_pos","_crate",["_crateVisualMarker",true],["_dropHeight", 150]];
		[(getPos _x), _x, true, 150] call blck_fnc_paraDropObject;
	} forEach _crates;
	
	_airborneCrates = _crates;
	while {count _airborneCrates > 0} do
	{
		uiSleep 1;
		{
			//  (((getPos _crate) select 2) < 3)
			if ((getPos _x) select 2 < 5) then 
			{
				_airborneCrates = _airborneCrates - [_x];
				_chute = _x getVariable["chute",objNull];
				detach _x;
				deleteVehicle _chute;
				_location = getPos _x;
				_blck_localMissionMarker = [format["crateMarker%1%2",_location select 0, _location select 1],_location,"","","ColorBlack",["mil_dot",[]]];
				_marker = [_blck_localMissionMarker] call blck_fnc_spawnMarker;
				_markers pushBack _marker; 
				uiSleep 0.5;
				_curPosCrate = getPos _x;
				_x setPos [_curPosCrate select 0, _curPosCrate select 1, 0.3];
				//_x setVectorDirAndUp[[0,1,0],[0,0,1]];
			};
		} forEach _crates;
	};

	uisleep 300;
	
	{
		deleteMarker _x;
	}forEach _markers;
};