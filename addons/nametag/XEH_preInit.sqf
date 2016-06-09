#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"


GVAR(tacticalHudMaxDistance) = 0;
GVAR(tacticalHudRefPosition) = [0,0,0];
GVAR(tacticalHudIconSize) = 0;

GVAR(tacticalHudMapEHID) = -1;
GVAR(tacticalHudLayer) = 0;
GVAR(tacticalHudHidden) = false;
GVAR(tacticalHudGroupData) = [];
GVAR(tacticalHudGroupDataRefreshTime) = 0;
GVAR(tacticalHudGroupDataPlayerIndex) = -1;
GVAR(tacticalHudRadarUnitsCache) = [];
GVAR(tacticalHudRadarUnitsCacheTime) = 0;
GVAR(nametagObjectsCache) = [];
GVAR(nametagObjectsCacheTime) = 0;

if (isNil QGVAR(members)) then {GVAR(members) = [[],[]];};

//Setting colors for getUnitData fnc
missionNameSpace setVariable ["a3cs_nametag_colors_red", ["#ff8b8b", [1,0.54,0.54,1]]];
missionNameSpace setVariable ["a3cs_nametag_colors_green", ["#9dff83", [0.61,1,0.51,1]]];
missionNameSpace setVariable ["a3cs_nametag_colors_blue", ["#83b5ff", [0.51,0.70,1,1]]];
missionNameSpace setVariable ["a3cs_nametag_colors_yellow", ["#ffe383", [1,0.89,0.51,1]]];

ADDON = true;
