#include "script_component.hpp"
/*
 * Author: SzwedzikPL, ARK
 * Handles killed event
 */

params ["_unit"];

if (!(local _unit) || {_unit getVariable [QEGVAR(common,isPlayer), false]}) exitWith {};

private _sound = "A3\Sounds_F\characters\human-sfx\";
private _soundData = selectRandom [
  ["Person0\P0_hit_", 13],
  ["Person1\P1_hit_", 11],
  ["Person2\P2_hit_", 9],
  ["Person3\P3_hit_", 13]
];

_sound = _sound + (_soundData # 0);

private _id = ceil (random (_soundData # 1));
if (_id < 10) then {
  _id = "0" + (str _id);
};

_sound = _sound + format ["%1.wss", _id];

[QGVAR(playVoiceLine), [_unit, _sound]] call CBA_fnc_globalEvent;