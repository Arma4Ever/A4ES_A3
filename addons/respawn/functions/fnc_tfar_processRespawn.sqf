#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles TFAR respawn
 */

params [["_newUnit", objNull], ["_oldUnit", objNull]];

if (!(isNull _newUnit) && {!(isNull _oldUnit)}) then {
  private _oldAssignedItems = assignedItems _oldUnit;
  private _radio = "";

  // Check old unit assigned items for tfar radios
  {
    if (_x call TFAR_fnc_isRadio) exitWith {
      _radio = _x;
    };
  } forEach _oldAssignedItems;

  // Exit this block if old unit has no radio
  if (_radio isEqualTo "") exitWith {};

  // Remove radio from old unit
  _oldUnit unlinkItem _radio;
  _oldUnit removeItem _radio;

  private _cfgWeapons = (configFile >> "CfgWeapons");

  // Check current unit assigned items for vanilla radio item
  {
    if (_x isKindOf ["ItemRadio", _cfgWeapons]) exitWith {
      // Remove radio item from current unit
      _newUnit unlinkItem _x;
      // Save radio class for radio request
      GVAR(inheritedRadio) = _radio;
    };
  } forEach (assignedItems _newUnit);
};

_this spawn TFAR_fnc_processRespawnOriginal;
