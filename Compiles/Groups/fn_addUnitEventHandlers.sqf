private _group = _this;
{
	_unit addMPEventHandler["MPKilled",{_this call GMS_fnc_unitKilled;}];  // Bare minimum killed EH
	_unit addMpEventHandler["MPHit",{_this call GMS_fnc_unitHit;}];			// bare minimum hit EH
	_unit addEventHandler["Reloaded",{_this call GMS_fnc_unitReloaded;}];	// Handle all reloads up to the max reloads set for the group
} forEach (units _group);