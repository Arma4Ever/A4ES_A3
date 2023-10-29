#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
  GVAR(moduleActivatorCyclePFH) = -1;
  GVAR(moduleActivatorCycleIndex) = -1;
  GVAR(activatorModuleCycleList) = [];

  GVAR(moduleActivatorPlayersPFH) = -1;
  GVAR(moduleActivatorPlayers) = [];
  GVAR(moduleActivatorPlayersNoHelis) = [];
  GVAR(moduleActivatorPlayersNoPlanes) = [];
  GVAR(moduleActivatorPlayersNoAir) = [];

  GVAR(createdLogicFlags) = createHashMap;
  GVAR(moduleActivatorFlags) = createHashMap;
  GVAR(activatorModulesFlags) = createHashMap;
  GVAR(logicFlagTitles) = createHashMap;
  
  GVAR(onKilled_killedEH) = -1;
  GVAR(onKilled_waitingModules) = [];

  // GVAR(radioJammerModules) = [];

  GVAR(3DENCompObjects) = [];

  [QGVAR(addAction_actionExecuted), {
    _this call FUNC(addAction_handleActionExecuted);
  }] call CBA_fnc_addEventHandler;

  [QGVAR(spawnData_waypoint), {
    _this call FUNC(units3DENComp_spawnData_waypointServer);
  }] call CBA_fnc_addEventHandler;
};

[QGVAR(addAction), {
  _this call FUNC(addAction_moduleExecLocal);
}] call CBA_fnc_addEventHandler;

[QGVAR(showMessage), {
  _this call FUNC(showMessage_moduleExecLocal);
}] call CBA_fnc_addEventHandler;

[QGVAR(setLogicFlagValue), {
  _this call FUNC(setLogicFlagValue);
}] call CBA_fnc_addEventHandler;

[QGVAR(addSuppliesAction), {
  _this call FUNC(suppliesStorage_moduleExecLocal);
}] call CBA_fnc_addEventHandler;

[QGVAR(spawnSupply), {
  _this call FUNC(suppliesStorage_spawnSupply);
}] call CBA_fnc_addEventHandler;

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
  [QGVAR(addAction), {
    _this call FUNC(addAction_moduleExecLocal);
  }];
  [QGVAR(addCuratorModule), {
    _this call FUNC(addCuratorModule_moduleExecLocal);
  }] call CBA_fnc_addEventHandler;
  [QGVAR(diagFPS_request), {
    _this call FUNC(curator_diagFPS_handleRequest);
  }] call CBA_fnc_addEventHandler;
  [QGVAR(diagFPS_receive), {
    _this call FUNC(curator_diagFPS_handleReceive);
  }] call CBA_fnc_addEventHandler;
};

if (is3DEN) then {
  0 call FUNC(initWarnings);
  GVAR(modulesActRangePreviews) = [];
  GVAR(modulesActRangePreviewsData) = [];

  ["Module_F", "init", {
    _this call FUNC(handleModuleInit);
  }, true, [], false] call CBA_fnc_addClassEventHandler;

  add3DENEventHandler ["OnSelectionChange", {
    0 call FUNC(updateSelectionPreviews);
  }];
};

ADDON = true;
