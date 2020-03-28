/*

*/
private _group = _this;
{
	_x addMPEventHandler["MPKilled",{_this call GMS_fnc_unitKilled;}];  // Bare minimum killed EH
	_x addMpEventHandler["MPHit",{_this call GMS_fnc_unitHit;}];			// bare minimum hit EH
	_x addEventHandler["Reloaded",{_this call GMS_fnc_unitReloaded;}];	// Handle all reloads up to the max reloads set for the group
} forEach (units _group);