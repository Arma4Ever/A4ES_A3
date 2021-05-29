#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * setLogicFlagValue module exec function
 */

params ["_logic"];
TRACE_1("setLogicFlagValue_moduleExec",_logic);

if !(isServer) exitWith {};

private _flag =  _logic getVariable [QGVAR(flag), ""];
if (_flag isEqualTo "") exitWith {
  ERROR("Flag is missing");
};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Set logic flag value

// Delete module
deleteVehicle _logic;
