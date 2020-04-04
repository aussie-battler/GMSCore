/*
	Copyright 2020 by Ghostrider-GRG-
*/
// _this is the object in question.

private _isUAV = -1;
if (isNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isUAV")) then 
{
	_isUAV = getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isUAV");
};
_isUAV