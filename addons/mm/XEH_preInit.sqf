#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(hiddenTerrainObjects) = [];
GVAR(cacheEnabled) = true;
GVAR(cacheInited) = false;
GVAR(cacheDistanceLand) = 1500;
GVAR(cacheDistanceHelicopters) = 1800;
GVAR(cacheDistancePlanes) = 0;
GVAR(cacheLeaders) = false;
GVAR(cacheGroupIndex) = 0;
GVAR(cacheModules) = [];

[QGVAR(showIntro), {
    if (!hasInterface) exitWith {};
    (QGVAR(missionIntro) call BIS_fnc_rscLayer) cutRsc ["RscA3CSIntroEffect", "PLAIN"];
}] call ace_common_fnc_addEventHandler;


[QGVAR(startWeaponSafety), {
    if (!(player isKindOf "VirtualMan_F")) then {
        [player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
    };
}] call ace_common_fnc_addEventHandler;

ADDON = true;
