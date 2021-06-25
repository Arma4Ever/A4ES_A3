#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * deleteMarker module exec function
 */

params ["_logic"];
TRACE_1("deleteMarker_moduleExec",_logic);

if !(isServer) exitWith {};

private _marker = _logic getVariable [QGVAR(deleteMarkerName), ""];
if (_marker isEqualTo "") exitWith {
  ERROR("Marker name is missing");
};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Delete marker
[_logic, true] call FUNC(moduleDeleteMarker);

// Delete module
deleteVehicle _logic;
