#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * addAction module exec function
 */

params ["_logic"];
TRACE_1("addAction_moduleExec",_logic);

if (isNull _logic) exitWith {};
