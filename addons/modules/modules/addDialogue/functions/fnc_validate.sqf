#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for addDialogue module
 */

params ["_module", "_values"];

// Auto setup dialogue id if not setuped yet
[_module, QGVAR(id), "dial_%1"] call FUNC(setUniqueIdAttribute);

private _warnings = [];



_warnings
