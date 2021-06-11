#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * setLogicFlagValue module exec function
 */

params ["_logic"];
TRACE_1("setLogicFlagValue_moduleExec",_logic);

if !(isServer) exitWith {};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Set logic flag value
[_logic, true] call FUNC(moduleSetLogicFlagValue);

// Delete module
deleteVehicle _logic;
