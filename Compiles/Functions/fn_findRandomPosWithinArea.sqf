/*
	GMS_fnc_findRandomPosWithinArea

	Purpose: Returns N positions within an area with spacing from nearby units/players and each other.

	Parameters
		_areaMarker: a marker designating the area to be search (rectangualr only)
		_noPositionsToFind: number of positions within the area to search for.
		_units: players or units from which a certain spacing should be kbRemoveTopic
		_separation: the spacing to use for positions, players/units, effectiveCommander
		_blackList: a list of areas to be avoided.
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_areaMarker","_noPositionsToFind",["_units",[]],["_separation",100],["_blackList",[]]];
{_blackList pushBack [getPos _x, _separation]} forEach _units;
private _spawnPos = [0,0,0];
private _posnFound = [];
for "_i" from 1 to _noPositionsToFind do
{
	_spawnPos = [[_areaMarker],_blackList/* add condition that the spawn is not near a trader*/] call BIS_fnc_randomPos;
	if (!isNil "_spawnPos" && !(_spawnPos isEqualTo [0,0])) then
	{
		_blackList pushBack [_spawnPos,[100,100,0,false]];
		_posnFound pushBack _spawnPos;
	};
};
//diag_log format["_findRandomPosWithinArea: _posnFound = %1",_posnFound];
_posnFound