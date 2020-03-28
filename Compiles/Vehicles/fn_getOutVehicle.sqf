

#define veh _this select 0
if ((isServer) || local (veh)) then {[veh] call blck_fnc_checkForEmptyVehicle};