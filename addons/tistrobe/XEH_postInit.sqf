#include "script_component.hpp"

["visionMode", {
  _this call FUNC(handleVisionModeChanged);
}] call CBA_fnc_addPlayerEventHandler;
