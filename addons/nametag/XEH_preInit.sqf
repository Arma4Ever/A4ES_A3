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

if(isNil QGVAR(members)) then {GVAR(members) = [[],[]];};

//Setting colors for getUnitData fnc
missionNameSpace setVariable ["a3cs_nametag_colors_red", ["#FF0000", [1,0,0,1]]];
missionNameSpace setVariable ["a3cs_nametag_colors_green", ["#00DB04", [0,0.85,0.15,1]]];
missionNameSpace setVariable ["a3cs_nametag_colors_blue", ["#1C7BFF", [0.1,0.48,1,1]]];
missionNameSpace setVariable ["a3cs_nametag_colors_yellow", ["#E0D422", [0.87,0.83,0.13,1]]];

ADDON = true;
