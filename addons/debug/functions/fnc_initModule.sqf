#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Registers module for mission debug
 */

params ["_logic"];

TRACE_1("initModule",_logic);

private _index = GVAR(modulesDrawData) findIf {(_x # 0) isEqualTo _logic};
if (_index isNotEqualTo -1) exitWith {
  TRACE_1("skipping initModule, module already inited",_index);
};

private _logicConfig = configOf _logic;
private _icon = getText (_logicConfig >> "icon");

_logic addEventHandler ["deleted", {
  params ["_logic"];
  private _logicId = _logic call BIS_fnc_netId;

  // Update module status if known id, update all deleted modules if not
  if (_logicId isEqualTo "") then {
    0 call FUNC(updateDeletedModules);
  } else {
    [_logicId] call FUNC(handleModuleDeleted);
  };
}];

private _syncs = (synchronizedObjects _logic) select {
  !(_x isKindOf "EmptyDetector")
};

private _hasArea = (getNumber (_logicConfig >> "canSetArea")) > 0;
private _area = _logic getVariable ["objectarea", [0, 0, 0, false]];
private _activationRange = 0;

// Get activation range if module is activated by players proximity
if (
  isClass (_logicConfig >> "Attributes" >> QEGVAR(modules,activationMode)) &&
  {(_logic getVariable [QEGVAR(modules,activationMode), 0]) isEqualTo 0}
) then {
  _activationRange = _logic getVariable [QEGVAR(modules,activationNearestPlayerDistance), 0];
};

private _index = GVAR(modulesDrawData) pushBack [
  _logic,
  _logic call BIS_fnc_netId,
  false,
  [
    getPos _logic,
    getText ((configOf _logic) >> "icon"),
    [0, 0, 0, 1],
    [1, 1, 1, 1],
    _activationRange,
    _hasArea,
    _area # 0,
    _area # 1,
    _area # 2,
    _area # 3,
    _syncs
  ]
];

_index
