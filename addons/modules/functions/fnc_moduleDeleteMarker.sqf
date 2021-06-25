#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Deletes marker based on module attributes
 */

params ["_logic", ["_deleteMarker", false]];
TRACE_2("moduleDeleteMarker",_logic,_deleteMarker);

// Read module deleteMarker attribute, _deleteMarker is used as default because
// deleteMarker module does not have this attribute
_deleteMarker = _logic getVariable [QGVAR(deleteMarker), _deleteMarker];

if (!_deleteMarker) exitWith {
  TRACE_1("moduleDeleteMarker - abort, deleting marker disabled",_logic);
};

private _marker = _logic getVariable [QGVAR(deleteMarkerName), ""];
if (_marker isEqualTo "") exitWith {
  ERROR("Marker name is missing");
};

private _markers = (_marker splitString ",") apply {trim _x};

// Delete markers
{
  deleteMarker _x;
} forEach _markers;
