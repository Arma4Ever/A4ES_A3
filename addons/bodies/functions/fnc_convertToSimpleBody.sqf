#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates simple body from given corpse
 */

params ["_corpse"];
TRACE_1("convertToSimpleBody",_corpse);

// Exit if not server or corpse is null (could be deleted already)
if (!isServer || {isNull _corpse}) exitWith {false};

private _corpseCargo = uniformContainer _corpse;
_corpseCargo setMaxLoad 99999;
if (isNull _corpseCargo) exitWith {
	// Unit has no uniform, restore unit in remains collector for deletion
	addToRemainsCollector [_corpse];
  false
};

// Prep unit loadout and weapons list
private _loadout = getUnitLoadout _corpse;
private _corpseVest = vest _corpse;
private _corpseBackpack = backpack _corpse;
private _weapons = [
  _loadout deleteAt 0,
  _loadout deleteAt 0,
  _loadout deleteAt 0,
  _loadout deleteAt 5
];

// Get corpse weapon from weapon holders
{
	// Skip holders that do not belong to this corpse
	if ((getCorpse _x) isNotEqualTo _corpse) then {continue;};

    private _weaponsItems = weaponsItemsCargo _x;
    if (_weaponsItems isNotEqualTo []) then {
      _weapons append _weaponsItems;
    };

	// Delete saved holders
	deleteVehicle _x;
} forEach (nearestObjects [_corpse, ["WeaponHolderSimulated"], 5]);

// Clear unit gear (only uniform left)
{_corpse unlinkItem _x} forEach (assignedItems _corpse);
_corpse unlinkItem (hmd _corpse);
removeGoggles _corpse;
removeHeadgear _corpse;
removeVest _corpse;
removeBackpackGlobal _corpse;
_corpse removeWeaponGlobal (primaryWeapon _corpse);
_corpse removeWeaponGlobal (secondaryWeapon _corpse);
_corpse removeWeaponGlobal (handgunWeapon _corpse);
_corpse removeWeaponGlobal (binocular _corpse);

// Move all gear to corpse uniform
if (_corpseVest != "") then {
	_corpseCargo addItemCargoGlobal [_corpseVest, 1];
};
if (_corpseBackpack != "") then {
	_corpseCargo addBackpackCargoGlobal [_corpseBackpack, 1];
};

// Clear added vest and bacpack
if (_corpseVest != "" || {_corpseBackpack != ""}) then {
  {
    _x params ["", "_container"];
    clearItemCargoGlobal _container;
    clearMagazineCargoGlobal _container;
    clearWeaponCargoGlobal _container;
  } forEach (everyContainer _corpseCargo);
};


_loadout params ["", "_vest", "_backpack", "_helmet", "_goggles", "_assignedItems"];

// Add assigned items to uniform
{_corpseCargo addItemCargoGlobal [_x, 1];} forEach _assignedItems;

// Add weapons to uniform (including weapons from corpse weapon holders)
{
  if (_x isEqualTo []) then {continue;};
  private _weaponItems = _x;
  private _mags = [
    _weaponItems deleteAt 4,
    _weaponItems deleteAt 4
  ];

  private _weapon = _weaponItems deleteAt 0;

  if (_weapon != "") then {
    _corpseCargo addWeaponCargoGlobal [_weapon, 1];
  };

  {
    if (_x isNotEqualTo []) then {
      _corpseCargo addItemCargoGlobal [_x # 0, 1];
    };
  } forEach _mags;

  {
    if (_x != "") then {
      _corpseCargo addItemCargoGlobal [_x, 1];
    };
  } forEach _weaponItems;
} forEach _weapons;

// Move vest and backpack items to uniform
{
  if (_x isEqualTo []) then {continue;};
  {
    _x params ["_item", "_count"];
    if (_item isEqualType "") then {
      _corpseCargo addItemCargoGlobal [_item, _count];
    };
    /*
      if (_item isEqualType []) then {
        // Add support for container in container & weapon in container?
      };
    */
  } forEach (_x # 1);
} forEach [_vest, _backpack];

// Add helmet and goggles to uniform
{
  if (_x != "") then {
    _corpseCargo addItemCargoGlobal [_x, 1];
  };
} forEach [_helmet, _goggles];

// Switch corpse group
if !(isNull (group _corpse)) then {
	LOG("Switching corpse group");
	private _group = GVAR(simpleBodiesGroup);
	if (isNull _group) then {
		LOG("Creating simple bodies group");
		_group = createGroup [civilian, false];
		GVAR(simpleBodiesGroup) = _group;
	};
	[_corpse] joinSilent _group;
};
// Save corpse as simple body
_corpse setVariable [QGVAR(isSimpleBody), true, true];
_corpse enableSimulationGlobal false;

// Remove from garbage collector if present
if (isInRemainsCollector _corpse) then {
  removeFromRemainsCollector [_corpse];
};

true