#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Condition function for the blood drawing
 */

params ["_medic", "_patient", "_volume"];

private _bloodVolume = (_patient getVariable ["ace_medical_bloodVolume", 6.0]);
private _volumeChange = _volume/1000;

(_bloodVolume > _volumeChange) &&
{[_medic, format ["ACE_bloodIV_%1", _volume]] call CBA_fnc_canAddItem}
