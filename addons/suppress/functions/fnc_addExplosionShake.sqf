#include "script_component.hpp"

params ["_object", ["_damage", -1]];
/*
 * Author: Cyruz
*/

private _dist = ace_player distance2D _object;
if (_dist > 1000) exitWith {};

if (_dist == 0) then {
    _dist = 5;
};

[{
    addCamShake [(1000 / _this) min 20, 1, 5]
}, _dist, _dist / 343] call CBA_fnc_waitAndExecute;