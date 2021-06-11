#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * playSound module exec function
 */

params ["_logic"];
TRACE_1("playSound_moduleExec",_logic);

if !(isServer) exitWith {};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

[_logic, true] call FUNC(modulePlaySound);

// Delete module
deleteVehicle _logic;
