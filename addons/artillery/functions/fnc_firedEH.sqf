#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles fired EH for artillery vehicles
 */

params ["_vehicle", "_weapon", "", "", "", "_magazine", "_projectile"];
TRACE_4("fireEH",_vehicle,_weapon,_magazine,_projectile);

// Exit if no artillery radars are currently active
if (GVAR(activeRadars) isEqualTo []) exitWith {};

// Exit if vehicle didn't fire from main gun
private _mainWeapon = GVAR(artWeaponsCache) getOrDefault [typeOf _vehicle, ""];
if (
  _mainWeapon == "" ||
  {_mainWeapon != _weapon}
) exitWith {};

private _startPos = getPos _vehicle;

[{
  _this call FUNC(trackProjectile);
}, [_projectile, _startPos, _magazine], 5] call CBA_fnc_waitAndExecute;
