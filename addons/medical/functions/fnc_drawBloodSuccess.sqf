#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles success of drawing blood action
 */

params ["_medic", "_patient", "_volume"];

private _drawedBlood = _patient getVariable [QGVAR(drawedBlood), 0];
private _drawVolumeTotal = _volume/1000;
private _volumeToDraw = _drawVolumeTotal - _drawedBlood;

private _bloodVolume = _patient getVariable ["ace_medical_bloodVolume", 6.0];

if (_bloodVolume < _volumeToDraw) exitWith {
  _medic addItem "A3CS_usedBloodBag";
};

if (_volumeToDraw > 0) then {
  _patient setVariable ["ace_medical_bloodVolume", (_bloodVolume - _volumeToDraw) max 0, true];
};

// Add correct blood bag
_medic addItem (format ["ACE_bloodIV_%1", _volume]);
