#include "script_component.hpp"

if(!isServer) exitWith {};

[FUNC(resetScoreLoop), 30, []] call CBA_fnc_addPerFrameHandler;
