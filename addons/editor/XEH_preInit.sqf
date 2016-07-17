#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (is3DEN) then {
    add3DENEventHandler ["OnMissionLoad", {[] call FUNC(edenDLCCheck)}];
    add3DENEventHandler ["OnMissionSave", {[] call FUNC(edenDLCCheck)}];
    add3DENEventHandler ["OnMissionAutosave", {[] call FUNC(edenDLCCheck)}];
};

ADDON = true;
