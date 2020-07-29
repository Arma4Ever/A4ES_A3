#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Executes generateSoldiers postExec handler on server
 */

params ["_logic"];

// Exec module postExec
LOG('Executing modulePostExec handler.');
_logic call (compile (_logic getVariable [QGVAR(modulePostExec), ""]));
