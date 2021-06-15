#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * setTimeMultiplier module exec function
 */

params ["_logic"];
TRACE_1("setTimeMultiplier_moduleExec",_logic);

if (isNull _logic || {!isServer}) exitWith {};
if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

private _timeMultiplier = _logic getVariable [QGVAR(timeMultiplier), 1];
setTimeMultiplier _timeMultiplier;

// Delete module
deleteVehicle _logic;
