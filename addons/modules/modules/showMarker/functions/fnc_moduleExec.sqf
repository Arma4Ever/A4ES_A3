#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * showMarker module exec function
 */

params ["_logic"];
TRACE_1("showMarker_moduleExec",_logic);

if !(isServer) exitWith {};

private _marker = _logic getVariable [QGVAR(showMarkerName), ""];
if (_marker isEqualTo "") exitWith {
  ERROR("Marker name is missing");
};

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Show marker
[_logic, true] call FUNC(moduleShowMarker);

// Delete module
deleteVehicle _logic;
