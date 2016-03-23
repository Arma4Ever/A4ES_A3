#include "script_component.hpp"

disableSerialization;
params ["_displayClass", "_params"];
_params params ["_display"];

GVAR(displayInterrupt) = true;
