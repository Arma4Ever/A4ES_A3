#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

#include "initSettings.sqf"

//--------- DEBUG -----------
GVAR(enable) = true;
GVAR(radarBackground) = QPATHTOF(data\radar\bg_blured.paa);
GVAR(radarBackgroundOpacity) = 0.75;
GVAR(memberlistColumnWidthScale) = 1;
//---------------------------
GVAR(enabled) = false;
GVAR(currentSquad) = locationNull;
GVAR(memberslistColumns) = [];
