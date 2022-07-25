#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Restores unit loadout inside simple body uniform
 */

params ["_unit", "_gear"];
private _cargo = uniformContainer _unit;
TRACE_3("restoreLoadout",_unit,_cargo,_gear);

_gear params ["_loadout", "_weaponHolders"];
private _weapons = [
  _loadout deleteAt 0,
  _loadout deleteAt 0,
  _loadout deleteAt 0,
  _loadout deleteAt 5
];
{_weapons append _x} forEach _weaponHolders;

_loadout params ["_uniform", "_vest", "_backpack", "_helmet", "_goggles", "_assignedItems"];

{_unit addItem _x} forEach _assignedItems;

{
  if (_x isEqualTo []) then {continue;};
  private _weaponItems = _x;
  private _mags = [
    _weaponItems deleteAt 4,
    _weaponItems deleteAt 4
  ];

  private _weapon = _weaponItems deleteAt 0;

  if (_weapon != "") then {
    _cargo addWeaponCargoGlobal [_weapon, 1];
  };

  {
    if (_x isNotEqualTo []) then {
      _cargo addItemCargoGlobal [_x # 0, 1];
    };
  } forEach _mags;

  {
    if (_x != "") then {
      _cargo addItemCargoGlobal [_x, 1];
    };
  } forEach _weaponItems;
} forEach _weapons;

{
  if (_x isEqualTo []) then {continue;};
  {
    _x params ["_item", "_count"];
    if (_item isEqualType "") then {
      _cargo addItemCargoGlobal [_item, _count];
    };
    /*
      if (_item isEqualType []) then {
        // Add support for container in container & weapon in container?
      };
    */
  } forEach (_x # 1);
} forEach [_uniform, _vest, _backpack];

{
  if (_x != "") then {
    _cargo addItemCargoGlobal [_x, 1];
  };
} forEach [_helmet, _goggles];
