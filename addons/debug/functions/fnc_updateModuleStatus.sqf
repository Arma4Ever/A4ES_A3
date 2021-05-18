#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates module status for mission debug
 */

params ["_logic", "_isActivated"];

TRACE_2("updateModuleStatus",_logic,_isActivated);

if !(is3DENPreview) exitWith {};

private _index = GVAR(modulesDrawData) findIf {(_x # 0) isEqualTo _logic};
if (_index isEqualTo -1) exitWith {};

private _data = GVAR(modulesDrawData) select _index;
if (_isActivated) then {
  _data set [3, [0, 0.5, 0, 1]];
  _data set [4, [1, 1, 1, 0.6]];
} else {
  _data set [3, [0, 0, 0, 1]];
  _data set [4, [1, 1, 1, 1]];
};

diag_log text format ["Moduł %1 %2", _logic, ["deaktywowany", "aktywowany"] select _isActivated];
