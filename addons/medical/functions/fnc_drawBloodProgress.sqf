#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles progress of drawing blood action
 */

params ["_args", "_volume"];
_args params ["_params", "_elapsedTime", "_totalTime"];
_params params ["_medic", "_patient"];

// Dead patient or no heart rate, cancel action
if (
  (!alive _patient) ||
  {_patient getVariable ["ace_medical_inCardiacArrest", false]}
) exitWith {false};

private _drawedBlood = _patient getVariable [QGVAR(drawedBlood), 0];

private _drawVolume = (_volume/1000) * (_elapsedTime / _totalTime);
private _volumeToDraw = (floor ((_drawVolume - _drawedBlood) * 100))/100;

if (_volumeToDraw <= 0) exitWith {true};

_patient setVariable [QGVAR(drawedBlood), _drawedBlood + _volumeToDraw];

private _bloodVolume = _patient getVariable ["ace_medical_bloodVolume", 6.0];
if (_bloodVolume < _volumeToDraw) exitWith {false};
_patient setVariable ["ace_medical_bloodVolume", (_bloodVolume - _volumeToDraw) max 0, true];

true
