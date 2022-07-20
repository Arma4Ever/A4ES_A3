#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(radarDialogUpdate), {
  _this call FUNC(updateRadarDialog);
}] call CBA_fnc_addEventHandler;

GVAR(radarDialogUpdateTimer) = scriptNull;

if (isServer) then {
  GVAR(artWeaponsCache) = createHashMap;
  GVAR(magShellTypeCache) = createHashMap;
  GVAR(radarProjectiles) = [];
  GVAR(activeRadars) = [];
  GVAR(shellCounter) = 0;
  GVAR(lastRadarSignalTime) = 0;

  [QGVAR(requestRadarDialogUpdate), {
    _this call FUNC(returnRadarDialogUpdate);
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
