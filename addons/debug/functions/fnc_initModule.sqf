#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Registers module for mission debug
 */

params ["_logic"];

TRACE_1("initModule",_logic);

private _icon = getText ((configOf _logic) >> "icon");

_logic addEventHandler ["deleted", {
  _this call FUNC(handleModuleDeleted);
}];

private _syncs = (synchronizedObjects _logic) select {
  !(_x isKindOf "EmptyDetector")
};

private _hasArea = (getNumber ((configOf _logic) >> "canSetArea")) > 0;
private _area = _logic getVariable ["objectarea", [0, 0, 0, false]];

GVAR(modulesDrawData) pushBack [
  _logic,
  getPos _logic,
  getText ((configOf _logic) >> "icon"),
  [0, 0, 0, 1],
  [1, 1, 1, 1],
  _hasArea,
  _area # 0,
  _area # 1,
  _area # 2,
  _area # 3,
  _syncs
];
