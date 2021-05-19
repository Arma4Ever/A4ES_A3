#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * registerArtilleryUnits module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || (_mode isNotEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

waitUntil {!isNil 'lambs_danger_Loaded_WP'};
if !(lambs_danger_Loaded_WP) exitWith {};

lambs_danger_debug_functions = true;

LOG('Starting execution of EXEC_MODULE_NAME.');

// Get all synced units and vehicles crews
private _syncedUnits = (synchronizedObjects _logic) apply {
  if (_x isKindOf "AllVehicles") then {crew _x} else {[]}
};

// Parse units into groups
private _groups = [];
{
  {
    private _group = group _x;
    if !(isNull _group) then {
      _groups pushBackUnique _group;
    };
  } forEach _x;
} forEach _syncedUnits;

// Register groups
{
  [_x] call lambs_wp_fnc_taskArtilleryRegister;
} forEach _groups;

// Delete module
deleteVehicle _logic;

LOG('Execution of EXEC_MODULE_NAME finished.');
