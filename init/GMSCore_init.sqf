/*
	GMSCore_init 
	Purpose initialize key global variables and log version number and build information.
	Parameters: None
	Return: none 
	Copyright 2020 by Ghostrider-GRG-
*/
#include "\GMSCore\Init\GMS_defines.hpp"

GMS_modType = if (!isNull (configFile >> "CfgPatches" >> "exile_server")) then {"Exile"} else {if (!isnull (configFile >> "CfgPatches" >> "a3_epoch_server")) then {"Epoch"} else {"default"}};
if ((tolower GMS_modType) isEqualto "epoch") then {
	GMS_Side = INDEPENDENT;
	GMS_unitType = "I_Soldier_M_F";	
};
if ((toLower GMS_modType) isEqualTo "exile") then
{
	GMS_Side = EAST;
	GMS_unitType = "O_Soldier_lite_F";	
};
if (toLower GMS_modType isEqualTo "default") then 
{
	GMS_Side = EAST;
	GMS_unitType = "O_Soldier_lite_F";
};
GMS_center = createCenter GMS_Side;
GMSCore_Initialized = true;
GMS_formation = "WEDGE";
GRGCore_monitoredMarkers = [];
GRGCore_monitoredObjects = [];
GMSCore_monitoredGroups = [];
GMSCore_monitoredAreaPatrols = [];

if (GMS_modType isEqualTo "Epoch") then
{
	GMS_soldierType = "I_Soldier_EPOCH";
};
if (GMS_modType isEqualTo "Exile" || GMS_modType isEqualTo "default") then
{
	GMS_soldierType = "i_g_soldier_unarmed_f";
};
if (GMS_modType isEqualTo "default") then 
{
	GMS_soldierType = "i_g_soldier_unarmed_f";
};

[] spawn GMS_fnc_mainThread;  //  Start the scheduler that does all the work.
private _ver =  getNumber(configFile >> "GMSCoreBuild" >> "version");
private _build = getNumber(configFile >> "GMSCoreBuild" >> "build");
private _buildDate = getText(configFile >> "GMSCoreBuild" >> "buildDate");
[format["GMSCore Build %1 Build Date %2 Initialized at %3 with GMS_modType = %4",_build,_buildDate,diag_tickTime,GMS_modType]] call GMS_fnc_log;

