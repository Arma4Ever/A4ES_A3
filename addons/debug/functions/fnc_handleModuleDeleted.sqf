#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles module deleted event
 */

params ["_logic"];

TRACE_1("handleModuleDeleted",_logic);

private _index = GVAR(modulesDrawData) findIf {(_x # 0) isEqualTo _logic};
if (_index isEqualTo -1) exitWith {};

private _data = GVAR(modulesDrawData) select _index;
_data set [3, [0, 0, 0, 0.4]];
_data set [4, [1, 1, 1, 0.2]];
