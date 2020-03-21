/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
#define unit _this select 0
#define newMagazine _this select 3 select 0
(unit) addMagazine (newMagazine);
[format["_unitReloaded:: one magazine of type %1 added to inventory of unit %2",newMagazine,unit]] call GMS_fnc_log;
