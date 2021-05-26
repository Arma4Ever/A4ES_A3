#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles module deleted event
 */

params ["_logicId"];

TRACE_1("handleModuleDeleted",_logicId);

private _index = GVAR(modulesDrawData) findIf {(_x # 1) isEqualTo _logicId};
if (_index isEqualTo -1) exitWith {};

private _data = GVAR(modulesDrawData) select _index;

_data set [2, true];
private _drawData = _data # 3;
_drawData set [2, [0, 0, 0, 0.4]];
_drawData set [3, [1, 1, 1, 0.2]];
