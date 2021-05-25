#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Registers module for mission debug
 */

params ["_logic"];

TRACE_1("initModule",_logic);

private _logicConfig = configOf _logic;
private _icon = getText (_logicConfig >> "icon");

_logic addEventHandler ["deleted", {
  _this call FUNC(handleModuleDeleted);
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

GVAR(modulesDrawData) pushBack [
  _logic,
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
];
