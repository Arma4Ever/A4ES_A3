#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Replaces given global marker with local copy (original global marker is deleted)
 */

params ["_marker", ["_markerData", []]];

private _markerShape = markerShape _marker;

// Exit if marker shape not supported
if !(_markerShape in ["ICON", "POLYLINE"]) exitWith {false};

// Handle polyline markers
if (_markerShape isEqualTo "POLYLINE") exitWith {
  // Get marker data
  private _markerPos = markerPos _marker;
  private _markerPolyline = markerPolyline _marker;
  private _markerColor = markerColor _marker;
  // Remove global marker
  deleteMarker _marker;
  // Create local copy
  createMarkerLocal [_marker, _markerPos];
  _marker setMarkerShapeLocal _markerShape;
  _marker setMarkerColorLocal _markerColor;
  _marker setMarkerPosLocal _markerPos;
  _marker setMarkerPolylineLocal _markerPolyline;

  true
};

// Exit if no marker data - this should never happen for ICON markers
if (_markerData isEqualTo []) exitWith {false};

private _markerText = markerText _marker;
_markerData params ["_markerClass", "_markerColor", "_markerPos", "_markerDir"];

if !(isClass (configfile >> "CfgMarkers" >> _markerClass)) then {
  _markerClass = "MilDot";
};

if !(isClass (configfile >> "CfgMarkerColors" >> _markerColor)) then {
  _markerColor = "Default";
};

// Remove global marker
deleteMarker _marker;
// Create local copy
createMarkerLocal [_marker, _markerPos];
_marker setMarkerShapeLocal _markerShape;
_marker setMarkerTypeLocal _markerClass;
_marker setMarkerColorLocal _markerColor;
_marker setMarkerPosLocal _markerPos;
_marker setMarkerDirLocal _markerDir;

true
