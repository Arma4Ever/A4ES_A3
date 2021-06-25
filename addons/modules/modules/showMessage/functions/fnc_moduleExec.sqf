#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * showMessage module exec function
 */

params ["_logic"];
TRACE_1("showMessage_moduleExec",_logic);

if ((isNull _logic) || !isServer) exitWith {};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Show message
[_logic, true] call FUNC(moduleShowMessage);

// Delete module
deleteVehicle _logic;
