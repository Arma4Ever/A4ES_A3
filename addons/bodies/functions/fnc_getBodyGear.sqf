#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns body loadout and weapons in weapon holders near body
 */

params ["_unit"];

private _loadout = getUnitLoadout _unit;
private _weapons = [];

private _holders = nearestObjects [_unit, ["WeaponHolderSimulated"], 2];

// Max 2 - primary & launcher
if ((count _holders) > 2) then {_holders resize 2};

{
  // Prevent multiple copies of the same holder
  if !(_x getVariable [QGVAR(alreadyCopied), false]) then {
    _x setVariable [QGVAR(alreadyCopied), true];
    private _weaponsItems = weaponsItemsCargo _x;
    if (_weaponsItems isNotEqualTo []) then {
      _weapons pushBack _weaponsItems;
    };
  };
} forEach _holders;

[_loadout, _weapons];
