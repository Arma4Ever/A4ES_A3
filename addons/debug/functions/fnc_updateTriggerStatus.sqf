#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates trigger status for mission debug
 */

params ["_trigger", "_isActivated"];

TRACE_2("updateTriggerStatus",_trigger,_isActivated);

private _index = GVAR(triggersDrawData) findIf {(_x # 0) isEqualTo _trigger};
if (_index isEqualTo -1) exitWith {};

private _data = GVAR(triggersDrawData) select _index;
_data set [2, [0, 0.6, 0, 1]];

diag_log text format ["Trigger %1 %2", _trigger, ["deaktywowany", "aktywowany"] select _isActivated];
