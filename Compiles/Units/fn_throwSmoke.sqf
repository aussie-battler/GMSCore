/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
_parameters = _this select 3;
(_this select 3) params[["_unit",objNull],["_smokeShell","SmokeShellBlue"],["_dir",0]];
if !(_smokeShell in (magazines _unit)) then {_unit addMagazine[_smokeShell,1];};
_dir = (player getRelDir _unit) + 180;
_unit setDir _dir;
[_unit,  [format["%1muzzle",_smokeShell],format["%1muzzle",_smokeShell]]] remoteExecCall ["forceWeaponFire",_unit];
