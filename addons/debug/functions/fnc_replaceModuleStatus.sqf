#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Replaces old logic with new logic in debug status
 */

params ["_oldLogic", "_newLogic"];
TRACE_2("replaceModuleStatus",_oldLogic,_newLogic);

if !(is3DENPreview) exitWith {};

private _index = GVAR(modulesDrawData) findIf {(_x # 0) isEqualTo _oldLogic};
if (_index isEqualTo -1) exitWith {};

TRACE_3("replaceModuleStatus - replacing",_oldLogic,_newLogic,_index);
private _data = GVAR(modulesDrawData) select _index;
_data set [0, _newLogic];
_data set [1, _newLogic call BIS_fnc_netId];
