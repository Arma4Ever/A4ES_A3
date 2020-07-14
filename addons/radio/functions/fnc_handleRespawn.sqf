#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles unit respawn
 */

params ["_unit", "_corpse"];

// Exit if unit not local or corpse is removed
if (!(local _unit) || isNull _corpse) exitWith {};

LOG_1('Handling respawn for "%1" unit',str _unit);

// Get corpse unique radios
private _corpseRadios = [_corpse] call acre_sys_core_fnc_getGear;
private _uniqueRadios = _corpseRadios select {
  [_x] call acre_sys_radio_fnc_isUniqueRadio
};

// Exit if corpse has no unique radios
if (_uniqueRadios isEqualTo []) exitWith {};

LOG_1('Moving radios from corpse to unit (radios: %1)',str _uniqueRadios);

// Remove unique radios from corpse
{
  [_corpse, _x] call acre_sys_core_fnc_removeGear;
} forEach _uniqueRadios;

// Add unique radios to player in next frame
[{
  params ["_unit", "_uniqueRadios"];
  {
    [_unit, _x] call acre_sys_core_fnc_addGear;
  } forEach _uniqueRadios;
}, [_unit, _uniqueRadios]] call CBA_fnc_execNextFrame;
