/*
// CREDITS: https://community.bistudio.com/wiki/boundingBoxReal
// fn_getDimensions: returns width, length and height based on boundingBoxReal
*/
#include "\GMSCore\Init\GMS_defines.hpp"
params["_object"];
_bbr = boundingBoxReal vehicle player;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
_return = [_maxWidth,_maxLength,_maxHeight];
_return