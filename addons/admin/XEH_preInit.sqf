#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(debugCameraEnabled) = false;
GVAR(debug3rdPersonEnabled) = false;
GVAR(debugCuratorEnabled) = false;

if (hasInterface) then {
  [QGVAR(debugCuratorActivated), {
    params ["_name"];
    TRACE_1("Event debugCuratorActivated",_name);
    systemChat format [LLSTRING(DebugCuratorActivated), _name];
  }] call CBA_fnc_addEventHandler;

  [QGVAR(debugCuratorDeactivated), {
    params ["_name"];
    TRACE_1("Event debugCuratorDeactivated",_name);
    systemChat format [LLSTRING(DebugCuratorDeactivated), _name];
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
