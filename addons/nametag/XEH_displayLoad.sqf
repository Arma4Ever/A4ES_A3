#include "script_component.hpp"

disableSerialization;
params ["_displayClass", "_params"];
_params params ["_display"];

A3CS_LOGINFO_1("handleDisplayLoad: %1",_this)

GVAR(displayInterrupt) = true;
