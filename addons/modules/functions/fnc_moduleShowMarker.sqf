#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows marker based on module attributes
 */

params ["_logic", ["_showMarker", false]];
TRACE_2("moduleShowMarker",_logic,_showMarker);

// Read module showMarker attribute, _showMarker is used as default because
// showMarker module does not have this attribute
_showMarker = _logic getVariable [QGVAR(showMarker), _showMarker];

if (!_showMarker) exitWith {
  TRACE_1("moduleShowMarker - abort, showing marker disabled",_logic);
};

private _marker = _logic getVariable [QGVAR(showMarkerName), ""];
if (_marker isEqualTo "") exitWith {
  ERROR("Marker name is missing");
};

private _markers = (_marker splitString ",") apply {trim _x};

// Show markers
private _alpha = _logic getVariable [QGVAR(showMarkerAlpha), 1];
{
  _x setMarkerAlpha _alpha;
} forEach _markers
