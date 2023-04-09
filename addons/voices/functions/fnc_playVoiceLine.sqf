#include "script_component.hpp"
/*
 * Author: SzwedzikPL, ARK
 * Plays given voice line for given unit
 */

params ["_unit", "_voiceLinePath"];

if (((positionCameraToWorld [0,0,0]) distance _unit) > 200) exitWith {};

playSound3D [_voiceLinePath, _unit, false, getPosASL _unit, 5, 1, 200, 0, true];

_unit setRandomLip true;
[{_this setRandomLip false}, _unit, 1] call CBA_fnc_waitAndExecute;