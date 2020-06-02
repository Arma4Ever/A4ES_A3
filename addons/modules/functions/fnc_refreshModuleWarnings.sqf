#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates module warnings ui
 */
params ["_warnings"];

// This should never happen in any case but check... just in case :P
if (isNil QGVAR(updateModuleWarningsParams)) exitWith {
  ERROR_1("Missing '%1' variable.",QGVAR(updateModuleWarningsParams));
};
// Get warnings control params
GVAR(updateModuleWarningsParams) params ["_controlGroup", "_config"];

// Get current module warnings
private _warnings = GVAR(dynamicAttributesModuleWarnings);
