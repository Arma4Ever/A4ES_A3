#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if !(is3DEN) exitWith {};

uiNamespace setVariable [QGVAR(currentAssetsTree), controlNull];

GVAR(assetsTreeFilterLoop) = scriptNull;
GVAR(currentAssetsTreeCount) = 0;

// Setup mission attributes
0 spawn {
  waitUntil {isGameFocused};
  sleep 2;
  0 call FUNC(setupMissionAttributes);
};
0 spawn FUNC(initAssetsTreeFiltering);

// Add units init EH for setup of dynamic simulation
["CAManBase", "init", {
  TRACE_1("CAManBase init",_this);
  _this spawn {
    params ["_unit"];
    sleep 0.001;
    if ("uav_ai" in (toLower (typeOf _unit))) exitWith {
      TRACE_1("CAManBase init abort, uav ai",_unit);
      (group _unit) set3DENAttribute [QGVAR(dynamicSimulationInited), true];
    };
    [group _unit] call FUNC(initEntityDynSim);
  };
}, true, [], true] call CBA_fnc_addClassEventHandler;

// Add objects init EH for setup of dynamic simulation
{
  [_x, "init", {
    _this spawn {
      sleep 0.001;
      _this call FUNC(initEntityDynSim);
    };
  }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach ["ThingX", "Car", "Tank", "Helicopter", "Plane", "Ship", "StaticWeapon"];

ADDON = true;
