#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for addDialogueAnswer module
 */

params ["_module", "_values"];

// Auto setup answer id if not setuped yet
[_module, QGVAR(id), "answ_%1"] call FUNC(setUniqueIdAttribute);

private _warnings = [];



_warnings
