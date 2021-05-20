#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
  GVAR(moduleActivatorPFH) = -1;
  GVAR(moduleActivatorIndex) = -1;
  GVAR(activatorModuleList) = [];

  GVAR(radioJammerModules) = [];
};

[QGVAR(addCuratorModule), {
  params ["_category", "_name", "_icon", "_function"];

  [
    _category,
    _name,
    compile format ["_this call %1;", _function],
    _icon
  ] call zen_custom_modules_fnc_register;
}] call CBA_fnc_addEventHandler;

[QGVAR(switchLightsLocal), {
  params ["_logic"];

  // Terminate current switch script if present
  private _currentSwitchScript = _logic getVariable [QGVAR(switchScript), scriptNull];
  if !(isNull _currentSwitchScript) then {
    terminate _currentSwitchScript;
  };

  // Switch lights
  private _switchScript = _this spawn FUNC(switchLights_switchLightsLocal);
  // Save script handler
  _logic setVariable [QGVAR(switchScript), _switchScript];
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
  [QGVAR(addCuratorModule), {
    _this call FUNC(addCuratorModule_moduleExecLocal);
  }] call CBA_fnc_addEventHandler;
};

if (is3DEN) then {
  call FUNC(initWarnings);

  ["Module_F", "init", {
    _this call FUNC(handleModuleInit);
  }, true, [], false] call CBA_fnc_addClassEventHandler;
};

ADDON = true;
