#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for createLogicFlag module
 */

params ["_module", "_values"];

// Auto setup flag id if not setuped yet
[_module, QGVAR(id), "logicFlag_%1"] call FUNC(setUniqueIdAttribute);

private _warnings = [];

_warnings
