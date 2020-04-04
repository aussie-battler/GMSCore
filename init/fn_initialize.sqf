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
call compileFinal preprocessFileLineNumbers "\GMSCore\Init\GMSCore_init.sqf";
diag_log format["[GMSCore] initialized at %1",diag_tickTime];
