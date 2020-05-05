/*
	Purpose: initialize GMSCore 
	Parameters: none
	Return: none
	By Ghostrider [GRG]
	Copyright 2020
*/
#include "\GMSCore\Init\GMS_defines.hpp"
//if ( !(isServer) || hasInterface) exitWith{diag_log "[GMSCore] ERROR: GMSCore SHOULD NOT BE RUN ON A CLIENT"};
//if !(isNil "GMSCore_Initialized") exitWith{diag_log "[GMSCore] ERROR: GMSCore HAS ALREADY BEEN LOADED"};
diag_log "[GMSCore: <Initializing GMSCore>]";
call compileFinal preprocessFileLineNumbers "\GMSCore\configs\GMS_configs.sqf";
//GMS_modType = if (!isNull (configFile >> "CfgPatches" >> "exile_server")) then {"Exile"} else {if (!isnull (configFile >> "CfgPatches" >> "a3_epoch_server")) then {"Epoch"} else {"default"}};
switch (true) do 
{
	case {!(isNull (configFile >> "CfgPatches" >> "exile_server"))}: 
	{
		GMS_modType = "exile";
		GMS_Side = EAST;
		GMS_unitType = "O_Soldier_lite_F";
	};
	case {!(isnull (configFile >> "CfgPatches" >> "a3_epoch_server"))}: 
	{
		GMS_modType = "epoch";
		GMS_Side = INDEPENDENT;
		GMS_unitType = "I_Soldier_M_F";			
	};
	default {
		GMS_modType = "default";
		GMS_Side = EAST;
		GMS_unitType = "O_Soldier_lite_F";		
	};
};

GMS_center = createCenter GMS_Side;
GMSCore_Initialized = true;
GMS_formation = "WEDGE";
GRGCore_monitoredMarkers = [];
GRGCore_monitoredObjects = [];
GMSCore_monitoredGroups = [];
GMSCore_monitoredAreaPatrols = [];
GMSCore_onRunoverHitpointDamage = [0.3-0.6];
GMSCore_onRunoverNoHitPointsDamaged = [1,4];

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
diag_log format["[GMSCore] initialized at %1",diag_tickTime];
