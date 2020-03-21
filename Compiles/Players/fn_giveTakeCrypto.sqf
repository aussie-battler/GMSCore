/*
	GMS_fnc_giveTakeCrypto

	Purpose: update crypto on player.

	Credits to EpochMod Team and He-Man in particular for pointing out this use of Epoch code.
	
*/
/*

*/
#include "\GMSCore\Init\GMS_defines.hpp"
diag_log format["giveTakeCrypto: _this = %1",_this];
_this call EPOCH_server_effectCrypto;
