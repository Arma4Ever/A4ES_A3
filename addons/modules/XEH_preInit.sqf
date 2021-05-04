#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

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

if (is3DEN) then {
  call FUNC(initWarnings);

  ["Module_F", "init", {
    _this call FUNC(handleModuleInit);
  }, true, [], false] call CBA_fnc_addClassEventHandler;
};

ADDON = true;
