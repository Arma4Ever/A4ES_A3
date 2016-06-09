#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_playerVisionModeChanged", {_this call FUNC(onVisionModeChanged);}] call CBA_fnc_addEventHandler;
[FUNC(strobePFH), 2, []] call CBA_fnc_addPerFrameHandler;
