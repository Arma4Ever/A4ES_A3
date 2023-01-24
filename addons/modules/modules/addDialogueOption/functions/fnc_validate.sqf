#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for addDialogueOption module
 */

params ["_module", "_values"];

// Auto setup option id if not setuped yet
[_module, QGVAR(id), "opt_%1"] call FUNC(setUniqueIdAttribute);

private _warnings = [];



_warnings
