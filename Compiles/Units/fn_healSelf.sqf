/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
(_this select 3) params["_unit"];
_countFAK = {_x isEqualTo "FAK"} count (magazines _unit);
if !("FAK" in (magazines _unit)) then 
{
	_unit addMagazine["FAK",1];
};
[_unit,["HealSoldierSelf",_unit]] remoteExecCall ["action",_unit];
[_unit,"FAK"] remoteExecCall ["removeMagazines",_unit];
_unit addMagazine["FAK",_countFAK];
