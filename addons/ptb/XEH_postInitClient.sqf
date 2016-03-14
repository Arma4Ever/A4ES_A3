#include "script_component.hpp"

if(!hasInterface) exitWith {};

["playerVisionModeChanged", {_this call FUNC(onVisionModeChanged);}] call ace_common_fnc_addEventHandler;
[FUNC(strobePFH), 2, []] call CBA_fnc_addPerFrameHandler;
