/*

*/
[format["_createUnmanedVehicleCrew: _this = %1 | typeName _this = %2",_this, typeName _this]];
private _veh = _this;  // just for ease of decyphering the code 
private _group = createVehicleCrew _veh;
_group call GMS_fnc_addUnitEventHandlers;
_group