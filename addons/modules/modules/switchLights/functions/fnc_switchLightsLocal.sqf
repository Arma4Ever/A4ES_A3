#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Switch lights module local exec
 */
params ["_logic", "_mode", "_missionTime"];

// Get logic area
private _logicArea = [getPos _logic];
_logicArea append (_logic getvariable "objectArea");
private _logicRange = (_logicArea # 1) max (_logicArea # 2);

// Collect lamps in area
private _lamps = (nearestObjects [
  _logic,
  ["house"],
  _logicRange,
  true,
  false
]) select {
  (_x inArea _logicArea) && {(configProperties [(configOf _x) >> "Reflectors", "isClass _x"]) isNotEqualTo []}
};

// Enable segments if enabled and not JIP with more than 10 sec delay
private _segments = (_logic getVariable [QGVAR(segments), false]) && {(abs (CBA_missionTime - _missionTime)) < 10};

// Sort lamps by pos if segments are enabled
if (_segments) then {
  private _segmentDir = _logic getVariable [QGVAR(segmentDir), 0];
  private _startPos = _logic getPos [_logicRange, _segmentDir + 180];
  _lamps = [_lamps, [_startPos], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy;
};

if (is3DENPreview) then {
  [_logic, "Rozpoczynam %1 %2 swiatel", ["wlaczanie", "wylaczanie"] select (_mode isEqualTo "OFF"), count _lamps] call EFUNC(debug,moduleLog);
};

// Switch lights
if (_segments) then {
  private _segmentSize = _logic getVariable [QGVAR(segmentSize), 1];
  private _segmentDelay = _logic getVariable [QGVAR(segmentDelay), 1];
  private _counter = 0;
  {
    _x switchLight _mode;
    _counter = _counter + 1;
    if (_counter >= _segmentSize) then {
      _counter = 0;
      sleep _segmentDelay;
    };
  } forEach _lamps;
} else {
  {_x switchLight _mode} forEach _lamps;
};

if (is3DENPreview) then {
  [_logic, "%2 swiatel zostalo %1", ["wlaczonych", "wylaczonych"] select (_mode isEqualTo "OFF"), count _lamps] call EFUNC(debug,moduleLog);
};
