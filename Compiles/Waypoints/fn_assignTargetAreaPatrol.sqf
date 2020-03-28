
/*
	Adds a group and its patrol area marker

	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\GMSCore\Init\GMS_defines.hpp"

params["_group","_target"];
_group setVariable["GMS_target",_target];
_group setVariable["GMS_targetGroup",group _target];
(leader _group) call GMS_fnc_nextWaypointAreaPatrol;
true