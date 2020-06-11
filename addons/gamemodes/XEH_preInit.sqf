#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

if !(is3DEN) exitWith {};

call FUNC(setupDefaultGameMode);
